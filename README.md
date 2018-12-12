# date-prefix
Prefix files with their associated creation date.

# Execution
$ cd path/to/dir/with/files/to/rename<br>
<br>
$ ruby path/to/datePrefix.rb<br>

# Example Usage
$ ls -la<br>
total 70376<br>
drwxr-xr-x    7 urieldjperez  eng      224 Dec 12 09:56 .<br>
drwx------+ 180 urieldjperez  eng     5760 Dec 12 09:56 ..<br>
-rw-r--r--@   1 urieldjperez  eng  7453825 Dec 12 09:56 510A0335.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  5484924 Dec 12 09:56 510A0720.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  6329389 Dec 12 09:56 510A1493.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  8032876 Dec 12 09:56 510A4362.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  8719607 Dec 12 09:56 510A9279.jpg<br>
$ ruby datePrefix.rb<br>
$ ls -la<br>
total 70376<br>
drwxr-xr-x    7 urieldjperez  eng      224 Dec 12 10:00 .<br>
drwx------+ 180 urieldjperez  eng     5760 Dec 12 09:56 ..<br>
-rw-r--r--@   1 urieldjperez  eng  7453825 Dec 12 09:56 20181212_510A0335.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  5484924 Dec 12 09:56 20181212_510A0720.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  6329389 Dec 12 09:56 20181212_510A1493.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  8032876 Dec 12 09:56 20181212_510A4362.jpg<br>
-rw-r--r--@   1 urieldjperez  eng  8719607 Dec 12 09:56 20181212_510A9279.jpg<br>
