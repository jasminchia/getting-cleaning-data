<h4>Where Does The Data Come From?</h4>

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

<h4>For each record it is provided:</h4>

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The following table relates the 17 signals to the names used as prefix for the variables names present in the data set. ".XYZ" denotes three variables, one for each axis.
<table>
<thead>
<tr>
<th>Name</th>
<th>Time domain</th>
<th>Frequency domain</th>
</tr>
</thead>
<tbody>
<tr>
<td>Body Acceleration</td>
<td>TimeDomain.BodyAcceleration.XYZ</td>
<td>FrequencyDomain.BodyAcceleration.XYZ</td>
</tr>
<tr>
<td>Gravity Acceleration</td>
<td>TimeDomain.GravityAcceleration.XYZ</td>
<td></td>
</tr>
<tr>
<td>Body Acceleration Jerk</td>
<td>TimeDomain.BodyAccelerationJerk.XYZ</td>
<td>FrequencyDomain.BodyAccelerationJerk.XYZ</td>
</tr>
<tr>
<td>Body Angular Speed</td>
<td>TimeDomain.BodyAngularSpeed.XYZ</td>
<td>FrequencyDomain.BodyAngularSpeed.XYZ</td>
</tr>
<tr>
<td>Body Angular Acceleration</td>
<td>TimeDomain.BodyAngularAcceleration.XYZ</td>
<td></td>
</tr>
<tr>
<td>Body Acceleration Magnitude</td>
<td>TimeDomain.BodyAccelerationMagnitude</td>
<td>FrequencyDomain.BodyAccelerationMagnitude</td>
</tr>
<tr>
<td>Gravity Acceleration Magnitude</td>
<td>TimeDomain.GravityAccelerationMagnitude</td>
<td></td>
</tr>
<tr>
<td>Body Acceleration Jerk Magnitude</td>
<td>TimeDomain.BodyAccelerationJerkMagnitude</td>
<td>FrequencyDomain.BodyAccelerationJerkMagnitude</td>
</tr>
<tr>
<td>Body Angular Speed Magnitude</td>
<td>TimeDomain.BodyAngularSpeedMagnitude</td>
<td>FrequencyDomain.BodyAngularSpeedMagnitude</td>
</tr>
<tr>
<td>Body Angular Acceleration Magnitude</td>
<td>TimeDomain.BodyAngularAccelerationMagnitude</td>
<td>FrequencyDomain.BodyAngularAccelerationMagnitude</td>
</tr>
</tbody>
</table>

For variables derived from mean and standard deviation estimation, the previous labels are augmented with the terms "Mean" or "StandardDeviation".

The data set is written to the file full_sensor_data.txt.
