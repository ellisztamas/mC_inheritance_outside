set.seed(504)

# list of accessions
g1001 <- c("6125", "1158", "6092", "6024", '8231',"6017", "6046", "6184", "6237", '6244', NA)
crosses <- c("6092 x 6024",
         "6092 x 1158",
         "6125 x 1158",
         "8231 x 1158",
         "8231 x 6024",
         "6125", "1158", "6092", "6024", "8231", # parental lines as well
         NA) # two blanks

# empty list to store positions for each block. There are 6 blocks per tray
# For the natural accessions there are 9 trays
# For the crosses there are 6 trays
positions <- vector('list', length =  6*9 + 6*6)

counter <- 1 # count unique blocks in the loop
# Loop over trays and blocks for the natural accessions
for(tray in 1:9){
  for(row in 1:6){
    positions[[counter]] <- 
      data.frame(
        experiment = "1001G",
        tray  = tray,
        row   = row,
        column = 1:11,
        block = counter,
        genotype = sample(g1001, 11, replace = F)
      )
    counter <- counter +1
  }
}
# Loop over trays and blocks for the crosses
for(tray in 10:15){
  for(row in 1:6){
    positions[[counter]] <- 
      data.frame(
        experiment = "crosses",
        tray  = tray,
        row   = row,
        column = 1:11,
        block = counter,
        genotype = sample(crosses, 11, replace = F)
      )
    counter <- counter +1
  }
}

# bind list
positions <- do.call('rbind', positions)
# Write to disk
write.csv(positions, "data_raw/randomisation_Aug2019.csv", row.names = F)
