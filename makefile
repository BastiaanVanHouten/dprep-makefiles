all:output/plot_all.pdf output/plot_Antwerp.pdf data/reviews.csv data/listings.csv temp/aggregated_df.csv

data/reviews.csv data/listings.csv: src/download_data.R
	R --vanilla < src/download_data.R

temp/aggregated_df.csv: data/reviews.csv data/listings.csv src/clean_data.R
	R --vanilla < src/clean_data.R
	
temp/pivot_table.csv: temp/aggregated_df.csv src/pivot.R
	R --vanilla < src/pivot.R
	
output/plot_Antwerp.pdf: temp/pivot_table.csv src/plot_Antwerp.R
	R --vanilla < src/plot_Antwerp.R

output/plot_all.pdf: temp/pivot_table.csv src/plot_all.R
	R --vanilla < src/plot_all.R