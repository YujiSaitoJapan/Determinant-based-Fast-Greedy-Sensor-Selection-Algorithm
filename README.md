# Determinant-based-Fast-Greedy-Sensor-Selection-Algorithm
This repository contains Matlab (R2013a) code to reproduce results for the Determinant-based Fast Greedy Sensor Selection Algorithm.

Due to GitHub file size limitations, a dataset is linked online:[NOAA Optimum Interpolation (OI) Sea Surface Temperature (SST) V2](https://www.esrl.noaa.gov/psd/data/gridded/data.noaa.oisst.v2.html)
- sst.wkmean.1990-present.nc
- lsmask.nc


Ocean sea surface temperature data is provided by NOAA.
NOAA_OI_SST_V2 data provided by the NOAA/OAR/ESRL PSD, Boulder, Colorado, USA, from their Web site at https://www.esrl.noaa.gov/psd/ in any documents or publications using these data

## License
[MIT-License](https://github.com/YujiSaitoJapan/Determinant-based-Fast-Greedy-Sensor-Selection-Algorithm/blob/add-license-1/LICENSE)

## Code
- main.m
  - NOAA_SST.m (reading data)
  - make_ensopod.m (truncating data)
  (sensor selection)
  - random_sensor.m
  - convex_sensor.m
  - QR_sensor.m
  - DG_sensor.m
  - QD_sensor.m
  
  - NOAA_SST_Perror.m (calculating percent reconstruction error)
  - det_calculation.m
  - averaged_operation.m
    - save_operation.m
  - data_organization.m
  
  - NOAA_SST_Video.m (making video)
  - makevideo_ensotrue.m (making video)
    - video_maker.m
      - display_sensors_color_for_movie.m

## Author
SAITO Yuji

[Experimental Aerodynamics Laboratory](http://www.aero.mech.tohoku.ac.jp/eng/)
Department of Aerospace Engineering
Graduate School of Engineering

Tohoku University, Sendai, JAPAN

E-mail: saito@aero.mech.tohoku.ac.jp

Github: [YujiSaitoJapan](https://github.com/YujiSaitoJapan)
