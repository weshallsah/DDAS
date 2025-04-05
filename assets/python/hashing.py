

import sys
import hashlib
import base64


def hashfile(filename):


    BUF_SIZE = 65536

    sha256 = hashlib.sha256()


    with open( filename, 'rb') as f:
        while True:

            newdata=""
            data = f.read(BUF_SIZE)
            if  ".txt" in filename:
                newdata = data.decode("utf-8").strip().replace('\r\n','').replace(' ','')

            # print(data)
            
            if not data:
                break

            if newdata:
                print(newdata.encode("utf-8"))
                sha256.update(newdata.encode("utf-8"))

            else :
                sha256.update(data)

    return sha256.hexdigest()


print("generating hash for file 1")
# file_hash = hashfile("img1.jpg")

print("generating hash for file 2\n")
# file_hash1 = hashfile("img2.jpg")

# if(file_hash==file_hash1):
#     print("file is same")

# else:
#     print("file is not same")

print(f"Hash : {file_hash}")
print(f"Hash : {file_hash1}")