% Rainfall-Runoff Model using the SCS-CN Method
clear; clc;

% Input Parameters
P = input('Enter the rainfall depth (in mm): ');  % Rainfall (mm)
CN = input('Enter the Curve Number (CN) of the watershed (30 to 100): ');  % Curve Number

% Calculate Initial Abstraction (Ia) and Maximum Potential Retention (S)
S = (25400 / CN) - 254;  % Potential maximum retention (mm)
Ia = 0.2 * S;  % Initial abstraction (mm)

% Check if rainfall is greater than initial abstraction
if P <= Ia
    Q = 0;  % No runoff if rainfall is less than initial abstraction
else
    % Runoff Calculation using the SCS-CN equation
    Q = ((P - Ia)^2) / (P - Ia + S);  % Runoff depth (mm)
end

% Convert runoff depth (Q) to runoff volume (m³) for a specific watershed area
Area = input('Enter the watershed area (in square kilometers): ');  % Watershed area (km²)
Area_m2 = Area * 1e6;  % Convert area to square meters (m²)
RunoffVolume = Q * Area_m2 / 1000;  % Runoff volume (m³)

% Display Results
fprintf('Rainfall Depth (P): %.2f mm\n', P);
fprintf('Runoff Depth (Q): %.2f mm\n', Q);
fprintf('Runoff Volume: %.2f cubic meters\n', RunoffVolume);

% Predict Flood Event Based on Runoff Volume
FloodThreshold = input('Enter the flood threshold runoff volume (in cubic meters): ');

if RunoffVolume > FloodThreshold
    disp('Warning: Flood event predicted based on the runoff volume!');
else
    disp('No flood event predicted.');
end
