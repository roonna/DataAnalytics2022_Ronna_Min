data(swiss)
# swiss[2] = Agriculture
# swiss[3] = Examination
# swiss[4] = Education
# swiss[5] = Catholic
# Swiss[6] = Infant.mortality
sclass <- kmeans(swiss[2:6], 3) 
# 3 centers for kmeans clusters
# ??
table(sclass$cluster, swiss[,1])    
