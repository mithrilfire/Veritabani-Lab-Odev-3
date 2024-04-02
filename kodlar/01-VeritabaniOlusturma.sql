CREATE DATABASE [odev3] ON PRIMARY
(
NAME= vtlab3_data,
FILENAME = "C:\vtlab\vtlab3data.mdf",
SIZE = 8MB,
MAXSIZE = unlimited,
FILEGROWTH = 10%
)
LOG ON
(
NAME= vtlab3_log,
FILENAME = "C:\vtlab\vtlab3log.ldf",
SIZE = 8MB,
MAXSIZE = unlimited,
FILEGROWTH = 10%
)