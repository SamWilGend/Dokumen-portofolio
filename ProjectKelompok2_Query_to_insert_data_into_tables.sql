Insert into MsStaff values('ST111','Doni','Jalan Jaksa no.43','081543756987','MALE','doni123@gmail.com','3500000'),
('ST112','Tio','Jalan Daan Mogot no.33','081231432157','MALE','tio123@gmail.com','4500000'),
('ST113','Agus','Jalan Gatot Subroto no.54','081333554878','MALE','agus123@gmail.com','5500000'),
('ST114','Kevin','Jalan Jenderal Sudirman no.31','081235432786','MALE','kevin123@gmail.com','3500000'),
('ST115','Roni','Jalan Gajah Mada no.56','081765245343','MALE','roni123@gmail.com','7700000'),
('ST116','Ica','Jalan Prapatan no.2','081040789899','FEMALE','ica12345@gmail.com','6500000'),
('ST117','Debi','Jalan Raya Bogor no.4','081133424543','FEMALE','debi1234@gmail.com','3900000'),
('ST118','Lina','Jalan Kramat Raya no.23','081652785325','FEMALE','lina9284@gmail.com','4500000'),
('ST119','Dita','Jalan Jenderal Ahmad Yani no.3','081125485635','FEMALE','dita32932@gmail.com','4400000'),
('ST120','Nina','Jalan Hayam Wuruk no.132','081785889689','FEMALE','nina5555@gmail.com','3400000')

Select * from MsStaff
Delete from MsStaff

Insert into MsCustomer values('CU001','Ivan','Jalan Soekarno Hatta no.4','081412432323','MALE','Ivan232@gmail.com'),
('CU002','Michael','Jalan Jambu No.44','081111354586','MALE','Michael23211@gmail.com'),
('CU003','Jordi','Jalan Pisang No.124','081958556545','MALE','Jordi132@gmail.com'),
('CU004','Rico','Jalan Veteran no.65','081021204548','MALE','Rico999@gmail.com'),
('CU005','Joe','Jalan Veteran no.23','081879524858','MALE','Joe889@gmail.com'),
('CU006','Jocelyne','Jalan Veteran no.90','081333335482','FEMALE','Jocelyne323@gmail.com'),
('CU007','Joy','Jalan Jenderal Sudirman No.23','081555524585','FEMALE','joy0203@gmail.com'),
('CU008','Merri','Jalan Jenderal Sudirman no.23','081363636363','FEMALE','merri9993@gmail.com'),
('CU009','Jenni','Jalan Yos Sudarso no.35','081468458655','FEMALE','jenni9999@gmail.com'),
('CU010','Cindy','Jalan Gatot Subroto No.99','081897585448','FEMALE','cindy123233@gmail.com')

Select * from MsCustomer
Delete from MsCustomer

Insert into MsVendor values('VE001','Budi','Jalan M.H.Tamrin no.3','081333141232','Rudi123@gmail.com'),
('VE002','Rika','Jalan Yos Sudarso no.5','081554668959','Rika123@gmail.com'),
('VE003','Saad Lamjarred','Jalan Jenderal Sudirman no.100','081554747858','Saad Lamjarred123@gmail.com'),
('VE004','Lina','Jalan Yos Sudarso no.87','081456231247','Lina3534@gmail.com'),
('VE005','Lisa','Jalan M.H.Tamrin no.50','081454244141','Lisa3245@gmail.com'),
('VE006','Soni','Jalan Jenderal Sudirman no.9','081786597457','Soni94895@gmail.com'),
('VE007','Dika','Jalan Veteran no.5','081455585252','Dika432199@gmail.com'),
('VE008','Raka','Jalan M.H.Tamrin no.78','081111474585','Raka99999@gmail.com'),
('VE009','Marni','Jalan Gatot Subroto no.52','08111254586','Marni57273@gmail.com'),
('VE010','Luis','Jalan Gatot Subroto no.123','081998656325','Luis090909@gmail.com')
Saad Lamjarred
Select * from MsVendor
Delete from MsVendor

Insert into MsClothCategory values('CA001','Cardigan'),
('CA002','Hoodie'),
('CA003','Blazer'),
('CA004','Vest'),
('CA005','Sweater'),
('CA006','Bolero'),
('CA007','Blouse'),
('CA008','Kemeja'),
('CA009','Kaos'),
('CA010','Tank Top'),
('CA011','Dress'),
('CA012','Gaun'),
('CA013','Gamis'),
('CA014','Overalls'),
('CA015','Jumpsuit'),
('CA016','Hot Pants'),
('CA017','Legging'),
('CA018','Jeans'),
('CA019','Jaket'),
('CA020','Polo shirt')

Select * from MsClothCategory
Delete from MsClothCategory

Insert into MsCloth values('CL001','Armani','500000','CA001','20'),
('CL002','Champion','650000','CA002','30'),
('CL003','Versace','580000','CA003','35'),
('CL004','Burberry','450000','CA004','25'),
('CL005','Ralph Lauren','470000','CA005','15'),
('CL006','Chanel','620000','CA006','34'),
('CL007','Bershka','320000','CA007','24'),
('CL008','Levi Strauss','400000','CA008','25'),
('CL009','Adidas','150000','CA009','30'),
('CL010','Uniqlo','180000','CA010','20'),
('CL011','Cartier','490000','CA011','24'),
('CL012','Under Armour','450000','CA012','22'),
('CL013','Michael Kors','550000','CA013','35'),
('CL014','Tom Ford','520000','CA014','43'),
('CL015','Christian Dior','600000','CA015','35'),
('CL016','Pandora','400000','CA016','46'),
('CL017','Hugo Boss','400000','CA017','15'),
('CL018','Tommy Hilfiger','450000','CA018','14'),
('CL019','Calvin Klein','3500000','CA019','28'),
('CL020','Timberland','400000','CA020','17')

Select * from MsCloth
Delete from MsCloth


Insert into HeaderPurchaseTransaction values('PU001','ST111','VE001','2020-10-08 20:55:05'),
('PU002','ST112','VE002','2020-10-15 20:57:15'),
('PU003','ST117','VE003','2020-10-19 20:59:05'),
('PU004','ST114','VE004','2020-10-23 20:59:15'),
('PU005','ST115','VE005','2020-10-27 21:00:05'),
('PU006','ST111','VE006','2020-10-29 21:02:00'),
('PU007','ST112','VE007','2020-11-01 21:03:13'),
('PU008','ST113','VE008','2020-11-07 21:05:05'),
('PU009','ST114','VE009','2020-11-13 21:06:25'),
('PU010','ST115','VE010','2020-11-16 21:07:03'),
('PU011','ST115','VE006','2020-11-20 21:09:01'),
('PU012','ST114','VE007','2020-11-27 21:10:00'),
('PU013','ST117','VE008','2020-11-30 21:10:05'),
('PU014','ST116','VE009','2020-12-02 21:10:12'),
('PU015','ST118','VE010','2020-12-03 21:11:19'),
('PU016','ST119','VE001','2020-12-04 21:12:54'),
('PU017','ST112','VE002','2020-12-05 21:13:23'),
('PU018','ST113','VE003','2020-12-07 21:14:28'),
('PU019','ST114','VE004','2020-12-08 21:15:00'),
('PU020','ST120','VE005','2020-12-09 21:18:50'),
('PU021','ST118','VE003','2020-04-02 15:23:10'),
('PU022','ST116','VE001','2020-07-02 15:23:10')

Select * from HeaderPurchaseTransaction
Delete from HeaderPurchaseTransaction

Insert into DetailPurchaseTransaction values('PU001','CL001','2'),
('PU001','CL012','1'),
('PU002','CL002','3'),
('PU002','CL020','1'),
('PU003','CL003','1'),
('PU003','CL016','1'),
('PU004','CL015','2'),
('PU004','CL004','1'),
('PU005','CL005','4'),
('PU005','CL004','3'),
('PU006','CL006','2'),
('PU007','CL007','4'),
('PU008','CL008','4'),
('PU009','CL009','5'),
('PU010','CL010','5'),
('PU011','CL011','3'),
('PU012','CL012','3'),
('PU013','CL013','1'),
('PU014','CL014','1'),
('PU015','CL015','5'),
('PU016','CL016','4'),
('PU017','CL017','3'),
('PU018','CL018','3'),
('PU019','CL019','4'),
('PU020','CL020','2'),
('PU021','CL005','1'),
('PU021','CL010','3'),
('PU022','CL002','12'),
('PU022','CL009','19')

Select * from DetailPurchaseTransaction
Delete from DetailPurchaseTransaction

Insert into HeaderSalesTransaction values('SA001','ST115','CU001','2020-11-09 20:36:05'),
('SA002','ST114','CU002','2020-11-09 20:38:00'),
('SA003','ST113','CU003','2020-11-10 20:39:12'),
('SA004','ST112','CU004','2020-11-11 20:40:38'),
('SA005','ST111','CU005','2020-11-12 20:42:53'),
('SA006','ST120','CU006','2020-11-13 20:44:02'),
('SA007','ST119','CU007','2020-11-14 20:45:12'),
('SA008','ST118','CU008','2020-11-15 20:48:43'),
('SA009','ST117','CU009','2020-11-15 20:49:55'),
('SA010','ST116','CU010','2020-11-16 20:54:21'),
('SA011','ST115','CU001','2020-11-18 20:55:05'),
('SA012','ST114','CU002','2020-11-20 20:59:12'),
('SA013','ST113','CU003','2020-11-21 21:00:02'),
('SA014','ST112','CU004','2020-11-22 21:03:13'),
('SA015','ST111','CU005','2020-11-26 21:05:12'),
('SA016','ST120','CU006','2020-11-29 21:17:04'),
('SA017','ST119','CU007','2020-11-30 21:18:09'),
('SA018','ST118','CU008','2020-12-5 21:24:00'),
('SA019','ST117','CU009','2020-12-6 21:25:43'),
('SA020','ST116','CU010','2020-12-12 21:26:05'),
('SA021','ST113','CU004','2020-05-09 13:36:00')


Select * from HeaderSalesTransaction
Delete from HeaderSalesTransaction

Insert into DetailSalesTransaction values('SA001','CL001','2'),
('SA001','CL012','1'),
('SA002','CL002','1'),
('SA002','CL007','3'),
('SA003','CL003','1'),
('SA003','CL019','1'),
('SA004','CL020','2'),
('SA004','CL004','1'),
('SA005','CL005','4'),
('SA005','CL015','3'),
('SA006','CL006','2'),
('SA007','CL007','4'),
('SA008','CL008','4'),
('SA009','CL009','5'),
('SA010','CL010','5'),
('SA011','CL011','3'),
('SA012','CL012','3'),
('SA013','CL013','1'),
('SA014','CL014','1'),
('SA015','CL015','5'),
('SA016','CL016','4'),
('SA017','CL017','3'),
('SA018','CL018','3'),
('SA019','CL019','4'),
('SA020','CL020','2'),
('SA021','CL005','2')

Select * from DetailSalesTransaction
Delete from DetailSalesTransaction