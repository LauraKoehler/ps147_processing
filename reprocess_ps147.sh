#DShip
shipspy dship -i ps147_dship.dat -o ps147_dship_mem.nc -a shipspy_settings/Polarstern_DShip_variables.yaml -s Polarstern
shipspy sections -i ps147_dship_mem.nc -o ps147_dship.nc -s shipspy_settings/PS147_sections.txt -a shipspy_settings/PS147_dship_global_attrs.yaml

#PAMOS

shipspy pamos -i pamos001_data/ -o ps147_pamos001_mem.nc -a shipspy_settings/pamos_variables.yaml -c shipspy_settings/laststring_header -f shipspy_settings/PS147_pamos_quality_flags.yaml -e shipspy_settings/pamos_additional_attrs.yaml
shipspy pamos -i pamos003_data/ -o ps147_pamos003_mem.nc -a shipspy_settings/pamos_variables.yaml -c shipspy_settings/laststring_header -f shipspy_settings/PS147_pamos_quality_flags.yaml -e shipspy_settings/pamos_additional_attrs.yaml
shipspy sections -i ps147_pamos001_mem.nc -o ps147_pamos001.nc -s shipspy_settings/PS147_sections.txt -a shipspy_settings/PS147_pamos_001_global_attrs.yaml
shipspy sections -i ps147_pamos003_mem.nc -o ps147_pamos003.nc -s shipspy_settings/PS147_sections.txt -a shipspy_settings/PS147_pamos_003_global_attrs.yaml
python3 shipposition4pamos.py

#Radiosondes

sounding_converter -i level0/*.mwx -o "level1/PS147_{platform}_L1-{direction}_%Y%m%dT%H%M_{version}.nc" -c information/config/main.yaml
sounding_converter -i level1/*.nc -o "level2/ARC_{platform}_L2-{direction}_%Y%m%dT%H%M_{version}.nc" -c information/config/main.yaml
shipspy rename -i level1/ -o ps147_radiosondes_level1_mem.nc -a shipspy_settings/radiosondes_variables_level1.yaml -d radiosondes
shipspy sections -i ps147_radio_level1_mem.nc -o ps147_radiosondes_level1.nc -s shipspy_settings/PS147_sections.txt -t start_time -a shipspy_settings/PS147_radiosondes_level1_global_attrs.yaml
shipspy rename -i level2/ -o ps147_radiosondes_level2_mem.nc -a shipspy_settings/radiosondes_variables_level2.yaml -d radiosondes
shipspy sections -i ps147_radiosondes_level2_mem.nc -o ps147_radiosondes_level2.nc -s shipspy_settings/PS147_sections.txt -t start_time -a shipspy_settings/PS147_radiosondes_level2_global_attrs.yaml

#CWV

shipspy rename -i POLARSTERN_GNSS_IWV_20250310_060000_20250413_115930.nc -o ps147_cwv_mem.nc -a shipspy_settings/CWV_variables.yaml -d cwv
shipspy sections -i ps147_cwv_mem.nc -o ps147_cwv.nc -s shipspy_settings/PS147_sections.txt -a PS147_cwv_global_attrs.yaml