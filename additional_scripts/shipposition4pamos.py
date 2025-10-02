import xarray as xr
import os

snums = ["001","003"]
dship = xr.open_dataset("ps147_dship.nc")
for sn in snums:   
    pamos = xr.open_dataset(f"ps147_pamos{sn}.nc")
    lats = pamos.lat
    lons = pamos.lon
    pamos = pamos.assign_coords({"lat_ship": dship.sel(time = pamos.time).lat, "lon_ship": dship.sel(time = pamos.time).lon})
    pamos["lat"] = lats
    pamos["lon"] = lons
    pamos.to_netcdf(f"ps147_pamos{sn}_shippos.nc")
    os.remove(f"ps147_pamos{sn}.nc")
    os.rename(f"ps147_pamos{sn}_shippos.nc", f"ps147_pamos{sn}.nc")
    print(f"Position from DShip successfully added to PAMOS {sn}")