function ROMS2SWAN(varargin);
%
% Function to convert a ROMS netCDF depth grid into a SWAN ASCII depth grid,
% and create the SWAN curvilinear coordinates grid.
%
% example 1:
% roms2swan('roms_grid.nc')
% If the input is the name of a netCDF file (string), the function calls the variables
% lon_rho, lat_rho, h, and mask_rho from the file.
%
% example 2:
% ncload roms_grid.nc
% roms2swan(lon_rho,lat_rho,h,mask_rho)
% if the input is four variables, it assumes
% that these are the variables x_rho (or lon_rho), y_rho (or lat_rho), 
% h, and mask_rho in that order.
%
% For both methods, two ASCII files are written for SWAN input:
% bathymetry goes to roms_bathy.bot and grid goes to grid_coord.grd.
%
% Soupy Alexander, 6/11/02
%
%If INPUT has COORDINATES SPHERICAL, then use lon and lat _rho.
%If INPUT has COORDINATES CARTESIAN, then use   x and   y _rho.
%

if nargin == 1;
    ncid = netcdf(varargin{1});
    x_rho = ncid{'lon_rho'}(:);
    y_rho = ncid{'lat_rho'}(:);
%   x_rho = ncid{'x_rho'}(:,:);
%   y_rho = ncid{'y_rho'}(:,:);
    h = ncid{'h'}(:);
    mask_rho = ncid{'mask_rho'}(:);
elseif nargin == 4;
    x_rho = varargin{1};
    y_rho = varargin{2};
    h = varargin{3};
    mask_rho = varargin{4};
else
    error('Improper number of inputs:  input netCDF file or four variables.');
end

clear ncid varargin

%Replace the land positions with the flag for land (defined in the SWAN
%input file)
%land_values = find(mask_rho == 0);
%h(land_values) = 9999;

%Print the depths to the bathy file
[m,n] = size(h);

fid = fopen('roms_bathy.bot','w');
for index = 1:m;
    for index2 = 1:n;
        fprintf(fid,'   ');
       fprintf(fid,'%12.8f',h(index,index2));
    end
    fprintf(fid,'\n');
end

%Print the grid coordinates to the grid file
fid = fopen('grid_coord.grd','w');
fprintf(fid,'%12.6f\n',x_rho');
fprintf(fid,'%12.6f\n',y_rho');

fclose('all');

disp('I created grid_coord.grd and roms_bathy.bot:  these are part of INPUT.');
