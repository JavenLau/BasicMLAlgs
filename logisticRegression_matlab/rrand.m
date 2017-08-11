

function[temp] = rrand(rows, columns, min, max)

temp = round((max-min)*rand(rows,columns)+min);

