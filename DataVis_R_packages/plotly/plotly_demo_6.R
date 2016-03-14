#Data
x = c("Consumer Groups", "Fisheries & Wildlife", "Commodity Brokers & Dealers", "Savings & Loans", "Bands, Orchestras & Other Live Music Production", "Tobacco", "Commercial Fishing", "Smelting & Refining", "Telephone Utilities", "Environmental Services & Equipment", "Crop Production & Basic Processing & Livestock", "Clergy", "Welfare/Social Work", "Live Theater/Other Entertainment Productions", "Aluminum Mining & Processing", "Recorded Music Production", "Water Utilities", "Movie Theaters", "Military", "Waste Management", "Hunting", "Banks & Lending Institutions", "Investment Holding Companies", "Farm Bureau", "Nuclear Energy", "Steel", "Payday/Title Loans", "Poultry & Eggs", "Homemakers/Non-income earners", "Nonprofit Institutions", "Recreation & Live Entertainment", "Gambling & Casinos", "Dairy", "Trucking", "Printing & Publishing", "Cable TV", "Electronics Manufacturing & Services", "Tobacco companies & tobacco product sales", "Business Associations", "Livestock", "Civil Servants/Public Officials", "Special Trade Contractors", "Forestry & Forest Products", "Home Builders", "Foreign & Defense Policy", "Sea Transport", "Finance & Credit Companies", "Credit Unions", "Lodging & Tourism", "Defense Electronics", "Agricultural Services & Products", "Mining", "Chemical & Related Manufacturing", "Building Materials & Equipment", "TV & Movie Production/Distribution", "Food Processing & Sales", "Health Services", "Construction Services", "Railroads", "Food & Beverage", "Business Services", "Accountants", "Education", "Beer, Wine & Liquor", "General Contractors", "Crop Production & Basic Processing", "Hospitals & Nursing Homes", "Defense Aerospace", "Retail Sales", "Automotive", "Computer Equipment & Services", "Electric Utilities", "Air Transport", "Telecom Services & Equipment", "Commercial Banks", "Pharmaceuticals & Health Products", "Oil & Gas", "Securities & Investment", "Real Estate", "Insurance", "Health Professionals")
y = c(25.0, 8094.15, 24389.0, 35025.0, 53311.0, 57450.0, 59623.0, 59800.0, 67907.0, 124791.28, 149764.26, 163043.33, 189986.74, 205726.61, 285837.0, 296738.01, 310349.0, 347949.0, 368957.72, 400518.43, 420246.0, 537652.0, 588551.0, 595627.0, 691332.25, 780572.0, 1182561.0, 1212742.0, 1446655.58, 1634732.87, 1670476.14, 1693908.29, 1704073.16, 1724169.83, 1767615.9, 1777862.0, 1908614.96, 1946460.24, 2105465.0, 2153676.23, 2286447.9, 2419660.43, 2448949.27, 2463920.0, 2518169.71, 2610439.87, 2674005.43, 2852362.61, 3084659.57, 3631552.63, 4097355.5, 4266717.0, 4429299.59, 4589196.06, 4635223.24, 4979937.13, 5166024.89, 5968971.83, 5977717.55, 6285165.9, 6440896.1, 6964923.07, 7144914.69, 7737954.43, 7771013.51, 7946875.29, 8627006.33, 8656718.07, 9163915.52, 9604585.69, 9640844.62, 11030476.61, 11790144.01, 13120911.34, 13122894.94, 13542921.43, 20064133.77, 22701133.82, 24205867.78, 25619909.92, 26656401.16)

my_z = c(184100.0, 339214.0, 740587.0, 501104.62, 2928835.5, 1125342.78, 471623.0, 29100.0, 271975.0, 1387907.2, 1462631.33, 332164.0, 424160.26, 193260.0, 1474399.85, 458365.0, 601539.0, 883703.0, 1558495.72, 1472759.0, 564971.0, 264259.15, 890762.83, 591075.68, 436450.0, 456682.0, 402144.8, 688085.0, 205400.0, 317019.0, 605672.69, 700846.0, 464382.0, 397842.0, 2089094.0, 1233140.0, 986433.0, 546258.39, 867640.0, 195550.0, 508647.0, 212690.0, 605125.0, 2992288.0, 243727.0, 1064487.0, 81200.0, 514495.0, 958530.0, 401280.0, 263995.0)
my_text = c("Oil & Gas", "Insurance", "Securities & Investment", "Health Professionals", "Health Professionals", "Oil & Gas", "Insurance", "Real Estate", "Insurance", "Real Estate", "Health Professionals", "Real Estate", "Health Professionals", "Oil & Gas", "Securities & Investment", "Health Professionals", "Oil & Gas", "Oil & Gas", "Oil & Gas", "Computer Equipment & Services", "Health Professionals", "Health Professionals", "Health Professionals", "Securities & Investment", "Insurance", "Oil & Gas", "Oil & Gas", "Insurance", "Oil & Gas", "Insurance", "Securities & Investment", "Health Professionals", "Oil & Gas", "Gambling & Casinos", "Real Estate", "Insurance", "Oil & Gas", "Health Professionals", "Health Professionals", "Insurance", "Insurance", "Insurance", "Health Professionals", "Oil & Gas", "Oil & Gas", "Securities & Investment", "Telecom Services & Equipment", "Computer Equipment & Services", "Insurance", "Mining", "Oil & Gas") 
my_locations = c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY")

#Plots
library(plotly)
plot_ly(x = x, y = y, type = 'bar', name = 'y') 
add_trace(z = my_z, locations = my_locations, text = my_text, type = "choropleth",
          showscale = FALSE, locationmode = "USA-states", name = '2012',
          marker = list(line = list(
            color = "rgb(255,255,255)", 
            width = 2)
          ), geo = 'geo',
          colorscale = list(list(0, "rgb(254, 240, 217)"), 
                            list(0.25, "rgb(253, 204, 138)"), 
                            list(0.5, "rgb(252, 141, 89)"), 
                            list(0.75, "rgb(227, 74, 51)"), 
                            list(1.0, "rgb(179, 0, 0)"))
) 
layout(
  title = "Top Industries 2014",
  xaxis = list(title = ""),
  yaxis = list(title = ""),
  margin = list(r=40, t=60, b=100, l=60), 
  geo = list(
    domain = list(x = c(0, 0.5), y = c(0, 1)), 
    lakecolor = "rgb(255, 255, 255)", 
    landcolor = "rgb(229, 229, 229)", 
    projection = list(type = "albers usa"), 
    scope = "usa", 
    showcountries = FALSE, 
    showlakes = TRUE, 
    showland = TRUE, 
    subunitcolor = "rgb(255, 255, 255)"
  )
)
