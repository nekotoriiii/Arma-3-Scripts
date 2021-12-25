import re
open_file = input("Enter name of file (including extension): ")
file = open(f"{open_file}", "r")
IDs = []
count = 0
for line in file:
    if "steamcommunity" in line:
        # Grab ID of the line
        IDs += [re.findall(r"\d+", line)]
        # Remove second element
        del IDs[count][1]

        count += 1


# print(IDs)

writeStuff = open("IDs.txt", "w")

for ID in IDs:
    writeStuff.write(f"{ID[0]}\n")
