SERIES_1="mpi allreduce"
SERIES_2="pwc parcel allreduce"
SERIES_3="isir mpi allreduce"
SERIES_4="isir parcel allreduce"

SERIES_1.COLOR="blue"
SERIES_2.COLOR="red"
SERIES_3.COLOR="black"
SERIES_4.COLOR="orange"

sr =c()
sr[1] ="sssss"
sr[2] ="aaaa"
sr[3] ="sssdsds"
sr[4] ="ss4534"

ser_cols = c("blue", "red", "bl", "or")
ser_labels = c(SERIES_1, SERIES_2, SERIES_3, SERIES_4)
num_series = 4

for (i in 1:num_series){
  if(i!=1){
    print(ser_cols[i])
    print(ser_labels[i])
    print(sr[i])
  }
}
