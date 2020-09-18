PSDS_PATH <- file.path('C:/Users/User/Desktop/sht3898/Data_Science/빅데이터인턴십/Ｒ')
PSDS_PATH

new_path <- file.path(PSDS_PATH, "student90.csv")
new_path
read.table(new_path, 
           sep = ",", 
           stringsAsFactors = FALSE,
           header = TRUE,
           na.strings = "")
