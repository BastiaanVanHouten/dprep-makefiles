all:plot_all.pdf plot_Antwerp.pdf reviews.csv listings.csv aggregated_df.csv

reviews.csv listings.csv: download_data.R
	R --vanilla < download_data.R

aggregated_df.csv: reviews.csv listings.csv clean_data.R
	R --vanilla < clean_data.R
	
pivot_table.csv: aggregated_df.csv pivot.R
	R --vanilla < pivot.R
	
plot_Antwerp.pdf: pivot_table.csv plot_Antwerp.R
	R --vanilla < plot_Antwerp.R

plot_all.pdf: pivot_table.csv plot_all.R
	R --vanilla < plot_all.R