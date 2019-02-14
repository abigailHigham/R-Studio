# R-Studio
R Studio
For this assignment, I created an interactive graphic in R-Studio to replicate Gapminder's Motion Chart.

IO data
For this project, I created dyadic data to compare which countries share membership in Intergovernmental Organizations. The goal of this project was to see how strongly connected two countries through intergovernmental organizations and weigh country IO partnerships relative to all of a countries partnerships. The data for international organization membership comes from the Diplometrics data set (Diplometrics 2018). Through a country’s intergovernmental organizations network, we hope to measure the domestic effects of ideational consensus. This way, for example, we can capture Slovenia’s environmental changes since joining the European Union in 2004. 

Trade data
The goal of the .do file is to measure trade networks. The trade network’s data comes from the International Monetary Fund’s Direction of Trade Statistics (International Monetary Fund 2018). To account for the dramatic difference in trade reporting, I calculate the total trade of goods (adjusted for freight on board) between two states by adding the total amount of annually reported imports recorded by both partners. I exclude the exports because states are more likely to accurately report imports than exports (Barberei 2009, 484). I use a country’s total sum of trade with all partners divided by trade with an individual partner to find the weight for each particular international partner. 

