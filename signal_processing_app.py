import pandas as pd
import numpy as np
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import scipy
from scipy.fftpack import fft, fftfreq, fftshift, ifft
from scipy import signal
from scipy.signal import butter, lfilter, filtfilt
from optcutfreq import optcutfreq
import os, glob
import pandas as pd
import numpy as np
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import scipy
import matplotlib.pyplot as plt
from scipy.signal import detrend
import sys
from scipy import integrate
from flask import Flask, jsonify, request
import json
import pickle

def signal_processing(data):
    '''
        data = a list containing 4 lists of 3 lists each
    '''

    ######### SIGNAL PROCESSING
    data_fc = pd.DataFrame({'TIME':np.array(data[0][0]),'COM_AP_acc':np.array(data[0][1]), 'COM_ML_acc':np.array(data[0][2])})
    data_fo = pd.DataFrame({'TIME':np.array(data[1][0]),'COM_AP_acc':np.array(data[1][1]), 'COM_ML_acc':np.array(data[1][2])})
    data_gc = pd.DataFrame({'TIME':np.array(data[2][0]),'COM_AP_acc':np.array(data[2][1]), 'COM_ML_acc':np.array(data[2][2])})
    data_go = pd.DataFrame({'TIME':np.array(data[3][0]),'COM_AP_acc':np.array(data[3][1]), 'COM_ML_acc':np.array(data[3][2])})

    def New_Data(df, Time):
        '''
            Create a new dataframe with the filtered data
        '''
        def residualanalysis_raw_data(column):
            '''
                Perform a residual analysis on each column to get the optimal cutoff frequency
            '''
            freq= np.mean(1/np.diff(Time))
            fc_opt= optcutfreq(column, freq, show=False)
            if fc_opt == None:
                opt =  15
            else:
                opt =  fc_opt 
            return opt

        def optcutfreq_store(df):
            '''
                Store each frequencies found in a list
            '''
            Opt_Freq_list= []   
            for i in df:
                Opt_Freq_list.append(residualanalysis_raw_data(df[i])) #fc_opt #list of optimal cutoff frequencies for each columns
            return Opt_Freq_list

        def Fourth_Order_bidirect_ButterW(column, fc_opt):
            '''
                4th Order Butterworth filter with 0 phase shift (low pass)(Hak et al. 2013)
            '''
            npasses= 2 # 2 pass (bidirectional)
            freq= np.mean(1/np.diff(Time))
            C = (2**(1/npasses) - 1)**0.25 #correction
            b, a = butter(4, (fc_opt/C)/(freq/4)) #4th order with correction the cutoff frequency for the number of passes in the filter
            filtered_column = filtfilt(b, a, column.values)  # filter with phase shift correction
            return filtered_column


        def filtred_store(df):
            '''
                Store each filtred column  in a list
            '''
            filtred_col_list= [] 
            fc_opt_list= optcutfreq_store(df)
            Column_list= []   
            for i in df:
                Column_list.append(df[i]) #list of each column datas
            for column, fc_opt in zip(Column_list, fc_opt_list):
                filtred_col_list.append(Fourth_Order_bidirect_ButterW(column, fc_opt)) #list of optimal cutoff frequencies for each columns
            return filtred_col_list
        names= list(df.columns)
        data = filtred_store(df)
        new_df = pd.DataFrame.from_dict(dict(zip(names, data)))  
        return new_df

    Clean_Data_fc = New_Data(data_fc.loc[:, ['COM_AP_acc', 'COM_ML_acc']], data_fc['TIME'].values)
    Clean_Data_fc['TIME'] = data_fc['TIME'].values
    Clean_Data_fc = Clean_Data_fc.loc[:, ['TIME', 'COM_AP_acc', 'COM_ML_acc']]
    Clean_Data_fo = New_Data(data_fo.loc[:, ['COM_AP_acc', 'COM_ML_acc']], data_fo['TIME'].values)
    Clean_Data_fo['TIME'] = data_fo['TIME'].values
    Clean_Data_fo = Clean_Data_fo.loc[:, ['TIME', 'COM_AP_acc', 'COM_ML_acc']]
    Clean_Data_gc = New_Data(data_gc.loc[:, ['COM_AP_acc', 'COM_ML_acc']], data_gc['TIME'].values)
    Clean_Data_gc['TIME'] = data_gc['TIME'].values
    Clean_Data_gc = Clean_Data_gc.loc[:, ['TIME', 'COM_AP_acc', 'COM_ML_acc']]
    Clean_Data_go = New_Data(data_go.loc[:, ['COM_AP_acc', 'COM_ML_acc']], data_go['TIME'].values)
    Clean_Data_go['TIME'] = data_go['TIME'].values
    Clean_Data_go = Clean_Data_go.loc[:, ['TIME', 'COM_AP_acc', 'COM_ML_acc']]


    ##################################################################
    ######## DOUBLE INTEGRATION

    def Double_integration(Time_column, column_to_filter):
        '''
            2X 6th Order Butterworth filter with 0 unidirectional (high pass)
        '''
        npasses= 1 # 1 pass (unidirectional)
        freq= np.mean(1/np.diff(Time_column))
        fc_opt= optcutfreq(column_to_filter, freq, show=False)
        if fc_opt == None:
            opt =  15
        else:
            opt =  fc_opt 
        C = (2**(1/npasses) - 1)**0.25 #correction
        b1, a1 = butter(6,(opt/C)/(freq/6) ,'highpass') #6th order with correction the cutoff frequency for the number of passes in the filter #(opt/C)/(freq/6)
        filtered_acc = filtfilt(b1, a1, column_to_filter.values)  # filter with phase shift correction
        velocity = integrate.cumtrapz(Time_column.values, filtered_acc)
        b2, a2 = butter(6, (opt/C)/(freq/6),'highpass') #6th order with correction the cutoff frequency for the number of passes in the filter
        filtered_vel = filtfilt(b2, a2, velocity)  # filter with phase shift correction
        displacement = integrate.cumtrapz(np.array(Time_column.to_list()[:-1]), filtered_vel)
        return [displacement, velocity]
    d = {'TIME_fc':Clean_Data_fc["TIME"].values, 'COM_AP_acc_fc':Clean_Data_fc["COM_AP_acc"].values, 'COM_ML_acc_fc':Clean_Data_fc["COM_ML_acc"].values,
    'COM_AP_vel_fc':Double_integration(Clean_Data_fc["TIME"], Clean_Data_fc["COM_AP_acc"])[1] , 'COM_ML_vel_fc':Double_integration(Clean_Data_fc["TIME"], Clean_Data_fc["COM_ML_acc"])[1],
    'COM_AP_disp_fc':Double_integration(Clean_Data_fc["TIME"], Clean_Data_fc["COM_AP_acc"])[0] , 'COM_ML_disp_fc':Double_integration(Clean_Data_fc["TIME"], Clean_Data_fc["COM_ML_acc"])[0],
    'TIME_fo':Clean_Data_fo["TIME"].values, 'COM_AP_acc_fo':Clean_Data_fo["COM_AP_acc"].values, 'COM_ML_acc_fo':Clean_Data_fo["COM_ML_acc"].values,
    'COM_AP_vel_fo':Double_integration(Clean_Data_fo["TIME"], Clean_Data_fo["COM_AP_acc"])[1] , 'COM_ML_vel_fo':Double_integration(Clean_Data_fo["TIME"], Clean_Data_fo["COM_ML_acc"])[1],
    'COM_AP_disp_fo':Double_integration(Clean_Data_fo["TIME"], Clean_Data_fo["COM_AP_acc"])[0] , 'COM_ML_disp_fo':Double_integration(Clean_Data_fo["TIME"], Clean_Data_fo["COM_ML_acc"])[0],
    'TIME_gc':Clean_Data_gc["TIME"].values, 'COM_AP_acc_gc':Clean_Data_gc["COM_AP_acc"].values, 'COM_ML_acc_gc':Clean_Data_gc["COM_ML_acc"].values,
    'COM_AP_vel_gc':Double_integration(Clean_Data_gc["TIME"], Clean_Data_gc["COM_AP_acc"])[1] , 'COM_ML_vel_gc':Double_integration(Clean_Data_gc["TIME"], Clean_Data_gc["COM_ML_acc"])[1],
    'COM_AP_disp_gc':Double_integration(Clean_Data_gc["TIME"], Clean_Data_gc["COM_AP_acc"])[0] , 'COM_ML_disp_gc':Double_integration(Clean_Data_gc["TIME"], Clean_Data_gc["COM_ML_acc"])[0],
    'TIME_go':Clean_Data_go["TIME"].values, 'COM_AP_acc_go':Clean_Data_go["COM_AP_acc"].values, 'COM_ML_acc_go':Clean_Data_go["COM_ML_acc"].values,
    'COM_AP_vel_go':Double_integration(Clean_Data_go["TIME"], Clean_Data_go["COM_AP_acc"])[1] , 'COM_ML_vel_go':Double_integration(Clean_Data_go["TIME"], Clean_Data_go["COM_ML_acc"])[1],
    'COM_AP_disp_go':Double_integration(Clean_Data_go["TIME"], Clean_Data_go["COM_AP_acc"])[0] , 'COM_ML_disp_go':Double_integration(Clean_Data_go["TIME"], Clean_Data_go["COM_ML_acc"])[0]
    }
    Final_data = pd.DataFrame(dict([ (k,pd.Series(v)) for k,v in d.items() ])).dropna()

    ##################################################################
    ######## DATA ANALYSIS
    ####

    #function
    def hyperellipsoid(P, y=None, z=None, pvalue=.95, units=None, show=False, ax=None):
        """
        Prediction hyperellipsoid for multivariate data.

        The hyperellipsoid is a prediction interval for a sample of a multivariate
        random variable and is such that there is pvalue*100% of probability that a
        new observation will be contained inside the hyperellipsoid [1]_.  
        The hyperellipsoid is also a tolerance region such that the average or
        expected value of the proportion of the population contained in this region
        is exactly pvalue*100% (called Type 2 tolerance region by Chew (1966) [1]_).

        The directions and lengths of the semi-axes are found, respectively, as the
        eigenvectors and eigenvalues of the covariance matrix of the data using
        the concept of principal components analysis (PCA) [2]_ or singular value
        decomposition (SVD) [3]_ and the length of the semi-axes are adjusted to
        account for the necessary prediction probability.

        The volume of the hyperellipsoid is calculated with the same equation for
        the volume of a n-dimensional ball [4]_ with the radius replaced by the
        semi-axes of the hyperellipsoid.

        This function calculates the prediction hyperellipsoid for the data,
        which is considered a (finite) sample of a multivariate random variable
        with normal distribution (i.e., the F distribution is used and not
        the approximation by the chi-square distribution).

        Parameters
        ----------
        P : 1-D or 2-D array_like
            For a 1-D array, P is the abscissa values of the [x,y] or [x,y,z] data.
            For a 2-D array, P is the joined values of the multivariate data.
            The shape of the 2-D array should be (n, p) where n is the number of
            observations (rows) and p the number of dimensions (columns).
        y : 1-D array_like, optional (default = None)
            Ordinate values of the [x, y] or [x, y, z] data.
        z : 1-D array_like, optional (default = None)
            Ordinate values of the [x, y] or [x, y, z] data.
        pvalue : float, optional (default = .95)
            Desired prediction probability of the hyperellipsoid.
        units : str, optional (default = None)
            Units of the input data.
        show : bool, optional (default = True)
            True (1) plots data in a matplotlib figure, False (0) to not plot.
            Only the results for p=2 (ellipse) or p=3 (ellipsoid) will be plotted.
        ax : a matplotlib.axes.Axes instance (default = None)

        Returns
        -------
        hypervolume : float
            Hypervolume (e.g., area of the ellipse or volume of the ellipsoid).
        axes : 1-D array
            Lengths of the semi-axes hyperellipsoid (largest first).
        angles : 1-D array
            Angles of the semi-axes hyperellipsoid (only for 2D or 3D data).
            For the ellipsoid (3D data), the angles are the Euler angles
            calculated in the XYZ sequence.
        center : 1-D array
            Centroid of the hyperellipsoid.
        rotation : 2-D array
            Rotation matrix for hyperellipsoid semi-axes (only for 2D or 3D data).

        References
        ----------
        .. [1] http://www.jstor.org/stable/2282774
        .. [2] http://en.wikipedia.org/wiki/Principal_component_analysis
        .. [3] http://en.wikipedia.org/wiki/Singular_value_decomposition
        .. [4] http://en.wikipedia.org/wiki/Volume_of_an_n-ball

        Examples
        --------
        >>> from hyperellipsoid import hyperellipsoid
        >>> y = np.cumsum(np.random.randn(3000)) / 50
        >>> x = np.cumsum(np.random.randn(3000)) / 100
        >>> area, axes, angles, center, R = hyperellipsoid(x, y, units='cm')
        >>> print('Area =', area)
        >>> print('Semi-axes =', axes)
        >>> print('Angles =', angles)
        >>> print('Center =', center)
        >>> print('Rotation matrix =\n', R)

        >>> P = np.random.randn(1000, 3)
        >>> P[:, 2] = P[:, 2] + P[:, 1]*.5
        >>> P[:, 1] = P[:, 1] + P[:, 0]*.5
        >>> volume, axes, angles, center, R = hyperellipsoid(P, units='cm')
        """

        from scipy.stats import f as F
        from scipy.special import gamma

        P = np.array(P, ndmin=2, dtype=float)
        if P.shape[0] == 1:
            P = P.T
        if y is not None:
            y = np.array(y, copy=False, ndmin=2, dtype=float)
            if y.shape[0] == 1:
                y = y.T
            P = np.concatenate((P, y), axis=1)
        if z is not None:
            z = np.array(z, copy=False, ndmin=2, dtype=float)
            if z.shape[0] == 1:
                z = z.T
            P = np.concatenate((P, z), axis=1)
        # covariance matrix
        cov = np.cov(P, rowvar=0)
        # singular value decomposition
        U, s, Vt = np.linalg.svd(cov)
        p, n = s.size, P.shape[0]
        # F percent point function
        fppf = F.ppf(pvalue, p, n-p)*(n-1)*p*(n+1)/n/(n-p)
        # semi-axes (largest first)
        saxes = np.sqrt(s*fppf)
        hypervolume = np.pi**(p/2)/gamma(p/2+1)*np.prod(saxes)
        # rotation matrix
        if p == 2 or p == 3:
            R = Vt
            if s.size == 2:
                angles = np.array([np.rad2deg(np.arctan2(R[1, 0], R[0, 0])),
                                90-np.rad2deg(np.arctan2(R[1, 0], -R[0, 0]))])
            else:
                angles = rotXYZ(R, unit='deg')
            # centroid of the hyperellipsoid
            center = np.mean(P, axis=0)
        else:
            R, angles = None, None

        if show and (p == 2 or p == 3):
            _plot(P, hypervolume, saxes, center, R, pvalue, units, ax)

        return hypervolume, saxes, angles, center, R


    def _plot(P, hypervolume, saxes, center, R, pvalue, units, ax):
        """Plot results of the hyperellipsoid function, see its help."""

        try:
            import matplotlib.pyplot as plt
        except ImportError:
            print('matplotlib is not available.')
        else:
            # code based on https://github.com/minillinim/ellipsoid:
            # parametric equations
            u = np.linspace(0, 2*np.pi, 100)
            if saxes.size == 2:
                x = saxes[0]*np.cos(u)
                y = saxes[1]*np.sin(u)
                # rotate data
                for i in range(len(x)):
                    [x[i], y[i]] = np.dot([x[i], y[i]], R) + center
            else:
                v = np.linspace(0, np.pi, 100)
                x = saxes[0]*np.outer(np.cos(u), np.sin(v))
                y = saxes[1]*np.outer(np.sin(u), np.sin(v))
                z = saxes[2]*np.outer(np.ones_like(u), np.cos(v))
                # rotate data
                for i in range(len(x)):
                    for j in range(len(x)):
                        [x[i,j],y[i,j],z[i,j]] = np.dot([x[i,j],y[i,j],z[i,j]], R) + center

            if saxes.size == 2:
                if ax is None:
                    fig, ax = plt.subplots(1, 1, figsize=(5, 5))
                # plot raw data
                ax.plot(P[:, 0], P[:, 1], '.-', color=[0, 0, 1, .5])
                # plot ellipse
                ax.plot(x, y, color=[0, 1, 0, 1], linewidth=2)
                # plot axes
                for i in range(saxes.size):
                    # rotate axes
                    a = np.dot(np.diag(saxes)[i], R).reshape(2, 1)
                    # points for the axes extremities
                    a = np.dot(a, np.array([-1, 1], ndmin=2))+center.reshape(2, 1)
                    ax.plot(a[0], a[1], color=[1, 0, 0, .6], linewidth=2)
                    ax.text(a[0, 1], a[1, 1], '%d' % (i + 1),
                            fontsize=20, color='r')
                plt.axis('equal')
                plt.grid()
                title = r'Prediction ellipse (p=%4.2f): Area=' % pvalue
                if units is not None:
                    units2 = ' [%s]' % units
                    units = units + r'$^2$'
                    title = title + r'%.2f %s' % (hypervolume, units)
                else:
                    units2 = ''
                    title = title + r'%.2f' % hypervolume
            else:
                from mpl_toolkits.mplot3d import Axes3D
                if ax is None:
                    fig = plt.figure(figsize=(7, 7))
                    ax = fig.add_axes([0, 0, 1, 1], projection='3d')
                ax.view_init(20, 30)
                # plot raw data
                ax.plot(P[:, 0], P[:, 1], P[:, 2], '.-', color=[0, 0, 1, .4])
                # plot ellipsoid
                ax.plot_surface(x, y, z, rstride=5, cstride=5, color=[0, 1, 0, .1],
                                linewidth=1, edgecolor=[.1, .9, .1, .4])
                # ax.plot_wireframe(x, y, z, color=[0, 1, 0, .5], linewidth=1)
                #                  rstride=3, cstride=3, edgecolor=[0, 1, 0, .5])
                # plot axes
                for i in range(saxes.size):
                    # rotate axes
                    a = np.dot(np.diag(saxes)[i], R).reshape(3, 1)
                    # points for the axes extremities
                    a = np.dot(a, np.array([-1, 1], ndmin=2))+center.reshape(3, 1)
                    ax.plot(a[0], a[1], a[2], color=[1, 0, 0, .6], linewidth=2)
                    ax.text(a[0, 1], a[1, 1], a[2, 1], '%d' % (i+1),
                            fontsize=20, color='r')
                lims = [np.min([P.min(), x.min(), y.min(), z.min()]),
                        np.max([P.max(), x.max(), y.max(), z.max()])]
                ax.set_xlim(lims)
                ax.set_ylim(lims)
                ax.set_zlim(lims)
                title = r'Prediction ellipsoid (p=%4.2f): Volume=' % pvalue
                if units is not None:
                    units2 = ' [%s]' % units
                    units = units + r'$^3$'
                    title = title + r'%.2f %s' % (hypervolume, units)
                else:
                    units2 = ''
                    title = title + r'%.2f' % hypervolume
                ax.set_zlabel('Z' + units2, fontsize=18)

            ax.set_xlabel('X' + units2, fontsize=18)
            ax.set_ylabel('Y' + units2, fontsize=18)
            plt.title(title)
            plt.show()

            return ax


    def rotXYZ(R, unit='deg'):
        """ Compute Euler angles from matrix R using XYZ sequence."""

        angles = np.zeros(3)
        angles[0] = np.arctan2(R[2, 1], R[2, 2])
        angles[1] = np.arctan2(-R[2, 0], np.sqrt(R[0, 0]**2 + R[1, 0]**2))
        angles[2] = np.arctan2(R[1, 0], R[0, 0])

        if unit[:3].lower() == 'deg':  # convert from rad to degree
            angles = np.rad2deg(angles)

        return angles


    #COM
    def get_com(df):
        COM_fc= df.loc[:, ['COM_AP_disp_fc', 'COM_ML_disp_fc']]
        COM_fc = detrend(COM_fc, axis=0, type='linear')
        COM_fo= df.loc[:, ['COM_AP_disp_fo', 'COM_ML_disp_fo']]
        COM_fo = detrend(COM_fo, axis=0, type='linear')
        COM_gc= df.loc[:, ['COM_AP_disp_gc', 'COM_ML_disp_gc']]
        COM_gc = detrend(COM_gc, axis=0, type='linear')
        COM_go= df.loc[:, ['COM_AP_disp_go', 'COM_ML_disp_go']]
        COM_go = detrend(COM_go, axis=0, type='linear')
        return [COM_fc, COM_fo, COM_gc, COM_go]

    #AREA
    def get_area(COM_data):
        area, axes, angles, center, R = hyperellipsoid((COM_data)[:, 1], (COM_data)[:, 0], units='m')
        return area

    #Range AP
    def rang(COM, axis_id):
        rang = np.max(COM, axis=0) - np.min(COM, axis=0)  # range (maximum - minimum)
        return rang[axis_id]

    def get_rang_AP(COM_data):
        range_ap= rang(COM_data, 0)
        return range_ap
    #Range ML
    def get_rang_ML(COM_data):
        range_ml= rang(COM_data, 1)
        return range_ml

    #Sway Length AP
    def sway_len(COM, axis_id):
        tpath = np.sum(np.abs(np.diff(COM, axis=0)), axis=0) # total path (length of the COP displacement)
        return tpath[axis_id]

    def get_SL_AP(COM_data):
        sl_ap= sway_len(COM_data, 0)
        return sl_ap

    #Sl ML
    def get_SL_ML(COM_data):
        sl_ml= sway_len(COM_data, 1)
        return sl_ml

    # Mean Velocity
    def get_mean_Velocity(vel_column):
        '''
            Calculate the mean velocity of COM
        '''
        
        return np.mean(vel_column.values)

    # RMS Mean acceleration

    def get_rms_acceleration(acc_column):
        '''
            Calculate the rms acceleration of COM
        '''
        return np.sqrt(np.mean(acc_column))

    ############################ ANALYSIS ###################################
    #fc
    Time_fc = Final_data['TIME_fc'].values
    new_com_fc = pd.DataFrame(get_com(Final_data)[0], columns=['COM_AP_disp_fc', 'COM_ML_disp_fc'])
    Final_data.drop(['COM_AP_disp_fc', 'COM_ML_disp_fc'], axis=1, inplace=True)
    df_list_fc= [Final_data, new_com_fc]
    Final_data=pd.concat(df_list_fc, axis= 1)
    #fo
    Time_fo = Final_data['TIME_fo'].values
    new_com_fo = pd.DataFrame(get_com(Final_data)[0], columns=['COM_AP_disp_fo', 'COM_ML_disp_fo'])
    Final_data.drop(['COM_AP_disp_fo', 'COM_ML_disp_fo'], axis=1, inplace=True)
    df_list_fo= [Final_data, new_com_fo]
    Final_data=pd.concat(df_list_fo, axis= 1)
    #gc
    Time_gc = Final_data['TIME_gc'].values
    new_com_gc = pd.DataFrame(get_com(Final_data)[0], columns=['COM_AP_disp_gc', 'COM_ML_disp_gc'])
    Final_data.drop(['COM_AP_disp_gc', 'COM_ML_disp_gc'], axis=1, inplace=True)
    df_list_gc= [Final_data, new_com_gc]
    Final_data=pd.concat(df_list_gc, axis= 1)
    #go
    Time_go = Final_data['TIME_go'].values
    new_com_go = pd.DataFrame(get_com(Final_data)[0], columns=['COM_AP_disp_go', 'COM_ML_disp_go'])
    Final_data.drop(['COM_AP_disp_go', 'COM_ML_disp_go'], axis=1, inplace=True)
    df_list_go= [Final_data, new_com_go]
    Final_data=pd.concat(df_list_go, axis= 1)




    outcomes = [get_area(new_com_fc.values), get_rang_AP(new_com_fc.values), get_rang_ML(new_com_fc.values), get_SL_AP(new_com_fc.values), get_SL_ML(new_com_fc.values),
    get_mean_Velocity(Final_data["COM_AP_vel_fc"]), get_mean_Velocity(Final_data["COM_ML_vel_fc"]), get_rms_acceleration(Final_data["COM_AP_acc_fc"])/9.8,
    get_rms_acceleration(Final_data["COM_ML_acc_fc"])/9.8,
    get_area(new_com_fo.values), get_rang_AP(new_com_fo.values), get_rang_ML(new_com_fo.values), get_SL_AP(new_com_fo.values), get_SL_ML(new_com_fo.values),
    get_mean_Velocity(Final_data["COM_AP_vel_fo"]), get_mean_Velocity(Final_data["COM_ML_vel_fo"]), get_rms_acceleration(Final_data["COM_AP_acc_fo"])/9.8,
    get_rms_acceleration(Final_data["COM_ML_acc_fo"])/9.8,
    get_area(new_com_gc.values), get_rang_AP(new_com_gc.values), get_rang_ML(new_com_gc.values), get_SL_AP(new_com_gc.values), get_SL_ML(new_com_gc.values),
    get_mean_Velocity(Final_data["COM_AP_vel_gc"]), get_mean_Velocity(Final_data["COM_ML_vel_gc"]), get_rms_acceleration(Final_data["COM_AP_acc_gc"])/9.8,
    get_rms_acceleration(Final_data["COM_ML_acc_gc"])/9.8,
    get_area(new_com_go.values), get_rang_AP(new_com_go.values), get_rang_ML(new_com_go.values), get_SL_AP(new_com_go.values), get_SL_ML(new_com_go.values),
    get_mean_Velocity(Final_data["COM_AP_vel_go"]), get_mean_Velocity(Final_data["COM_ML_vel_go"]), get_rms_acceleration(Final_data["COM_AP_acc_go"])/9.8,
    get_rms_acceleration(Final_data["COM_ML_acc_go"])/9.8
    ]

    df = pd.DataFrame([outcomes], columns=['Area (m^2)_fc', 'Range AP (m)_fc', 'Range ML (m)_fc', "Sway Length AP (m)_fc", "Sway Length ML (m)_fc",
    'Mean Velocity AP (m/s)_fc', 'Mean Velocity ML (m/s)_fc', 'RMS Acc AP (g)_fc', 'RMS Acc ML (g)_fc',
    'Area (m^2)_fo', 'Range AP (m)_fo', 'Range ML (m)_fo', "Sway Length AP (m)_fo", "Sway Length ML (m)_fo",
    'Mean Velocity AP (m/s)_fo', 'Mean Velocity ML (m/s)_fo', 'RMS Acc AP (g)_fo', 'RMS Acc ML (g)_fo',
    'Area (m^2)_gc', 'Range AP (m)_gc', 'Range ML (m)_gc', "Sway Length AP (m)_gc", "Sway Length ML (m)_gc",
    'Mean Velocity AP (m/s)_gc', 'Mean Velocity ML (m/s)_gc', 'RMS Acc AP (g)_gc', 'RMS Acc ML (g)_gc',
    'Area (m^2)_go', 'Range AP (m)_go', 'Range ML (m)_go', "Sway Length AP (m)_go", "Sway Length ML (m)_go",
    'Mean Velocity AP (m/s)_go', 'Mean Velocity ML (m/s)_go', 'RMS Acc AP (g)_go', 'RMS Acc ML (g)_go'
    ])
    return outcomes