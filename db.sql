USE [ShopTree]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 12/16/2019 7:30:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Avatar] [varchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[View] [int] NULL,
	[DatePost] [datetime] NULL,
	[Priority] [int] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/16/2019 7:30:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [nvarchar](250) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/16/2019 7:30:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[TotalMoney] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 12/16/2019 7:30:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliveries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](150) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/16/2019 7:30:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[Address] [nvarchar](50) NULL,
	[LevelId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Url] [varchar](250) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[Tax] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [varchar](50) NULL,
	[OrderDate] [date] NULL,
	[CustomerId] [int] NULL,
	[DeliveryId] [int] NULL,
	[Discount] [int] NULL,
	[Tax] [int] NULL,
	[PaymentMethodId] [int] NULL,
	[ProcessingEmployeeId] [int] NULL,
	[ShipperEmployeeId] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[OrderStatusId] [int] NULL,
	[CancelReason] [nvarchar](100) NULL,
	[DeliveryDate] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](250) NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CategoryId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[StockQuantity] [bigint] NULL,
	[Views] [bigint] NULL,
	[Priority] [int] NULL,
	[Discount] [int] NULL,
	[Status] [bit] NULL,
	[Avatar] [nvarchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 12/16/2019 7:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[IsLikeWater] [bit] NULL,
	[IsLikeSunny] [bit] NULL,
	[RecommendSunnyHour] [int] NULL,
	[RecommendWater] [int] NULL,
	[RecommendFertilizer] [int] NULL,
	[RecommendTemperature] [int] NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (1, N'Trầu bà Nam Mỹ lá xẻ', N'Assets/client/images/blog/trau-ba-nam-my.jpg ', N'Cây trầu bà Nam Mỹ lá xẻ nó còn được gọi tên thân thiện là Swiss Chesse,  ngoài ra còn có các tên khác ở việt nam như, Ráy Nam Mỹ, Trầu bà lá rách, Trầu Bà Cửa Sổ, Trầu Bà chân Vịt, Trầu Bà Quý Phi, vì hình chiếc lá bản rộng của Monstera khi trưởng thành được xẻ ra trồng giống những lát phô mai của Thụy Sỹ.  Mặc dù phát triển khá mạnh trong nhà nhưng Monstera cần nhiều dinh dưỡng và độ ẩm để phát triển. Là loại cây có xuất xứ từ châu Mỹ, vậy nên các đặc tính của cây rất thích hợp để có thể sinh trưởng và phát triển tốt với khí hậu miền Nam. Đồng thời, ráy Mỹ lá xẻ lại là cây ít gặp phải sâu bệnh gây hại nên việc chăm sóc cây cũng đơn giản hơn rất nhiều. Cây trầu bà Nam Mỹ lá xẻ là loại cây ưa nửa râm, vì vậy nên cân bằng ánh sáng để giúp cây phát triển tốt, nghĩa là nên tránh ánh sáng trực tiếp cũng như không để cây trong bóng râm quá lâu ngày. Với vẻ đẹp sang trọng của cây, trầu nam mỹ lá xẻ góp phần tạo cho ngôi nhà của bạn một nét đẹp quyền uy, sang trọng.  Thân, Tán, Lá: Trầu bà lá xẻ mọc thành bụi nhỏ, có thân thảo. Cây trưởng thành cao tầm 1m. Lá cây trầu bà có cuống dài, màu xanh lục, tập trung ở đầu cành, chìa thùy dạng lông chim trông rất đẹp. Cây phân cành thành rất nhiều nhánh, xếp tỏa ra rất đều.', 10, CAST(N'2018-06-16T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (2, N'Lan Ý Mỹ', N'Assets/client/images/blog/lan-y-my.jpg', N'Cây Lan Ý Mỹ là cây ưa râm, có thể sống hoàn toàn trong nhà, có tốc độ sinh trưởng nhanh và nhiều lá sum sê cho nên được nhiều người sử dụng làm cây nội thất trang trí trong nhà.

Cây cũng có thể trồng trong chậu sứ để đặt trong phòng khách, hay trước hành lang nhà.

Ngoài ra nhiều người còn sử dụng cây để trồng trang trí tạo viền quanh lối đi trong sân vườn, hoặc có thể trồng thành mãng dài trong bồn hoa để tạo điểm nhấn rất nổi bậc. Gần đây cây cũng được sử dụng để trồng tạo bức tường cây rất đẹp.Lan Ý Mỹ này có nhiều ý nghĩa như làm sạch không khí, hút các bụi bẩn xunh quanh làm cho môi trường trong lành dễ chịu hơn.

Ý nghĩa phong thủy của cây là mang nhiều may mắn tài lộc trong cuộc sống và thuận lợi trong công việc cho gia chủ.Cây Lan Mỹ hay Lan Ý Mỹ là loại cây ưa bóng, phù hợp làm cây trồng nội thất. Cây mang nhiều ý nghĩa như làm sạch không khí trong nhà, trang trí nội thất và đặc biệt là mang tài lộc, may mắn đến cho Gia chủ.

Cây Lan Ý Mỹ được trồng trong chậu để làm cây nội thất, cây xanh văn phòng ở nhiều vị trí như: góc phòng,bàn làm việc, bệ cửa sổ, gần lối ra vào…Vẻ đẹp tươi tắn, viên mãn và khả năng lọc không khí tốt của Cây Lan Ý Mỹ giúp không gian văn phòng thêm thoáng đãng, trong lành và gần gũi với thiên nhiên.

Ngoài ra Cây Lan Ý Mỹ còn được trồng cho các công trình, cảnh quan đẹp ngoài ý nghĩa phong thủy cây còn có tác dụng làm cây bóng mát cực tốt ở các cảnh quan. Trong các bản thiết kế sân vườn thì với một số kiểu mẫu cổ điển hoặc phương đông hay sử dụng Cây Lan Ý Mỹ làm cây điểm nhấn của cảnh quan.

Vẻ đẹp của Cây Lan Ý Mỹ được trang trọng trưng bày nơi nhà khách, phòng triển lãm, hội trường, đình chùa để làm cảnh quan thêm sang trọng.

Màu trắng của hoa Lan Ý tượng trưng cho sự ngây thờ, yên bình và trong sáng. Màu xanh mát mẻ, hy vọng và sức trẻ. Sự hài hoà giữa mảng xanh, điểm xuyến bởi hoa trăng, Lan Ý nổi bật mà vẫn kiêu sa, đầy sức sống.

Cây Lan Mỹ trong phong thủy còn có tác dụng điều hòa trường khí mang lại sự hài hòa trong căn phòng.

Đối với môi trường cây Lan Mỹ có tác dụng hấp thụ các tia có hại cho sức khỏe con người.

Hoa của cây với màu trắng thể hiện cho sự trong trắng tinh túy và thanh cao.', 9, CAST(N'2018-06-16T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (3, N'Cây lưỡi hổ', N'Assets/client/images/blog/cay-luoi-ho.jpg', N'Cây lưỡi hổ hiện nay rất được ưa chuộng trồng trong nhà và các văn phòng.Quý khách đều biết Cây Lưỡi Hổ là một trong những loại cây cảnh văn phòng và cây cảnh nội thất thì tất nhiên cây Lưỡi Hổ có tác dụng trước tiên là làm cảnh và trang trí cho ngôi nhà, văn phòng rồi. 

Cây lưỡi hổ có tác dụng thanh lọc không khí rất tốt, chúng hấp thụ các chất gây ô nhiễm môi trường và 107 loại độc tố, trong đó có cả các độc tố gây ung thư. Ngoài ra, trong phong thủy loại cây này có tác dụng trừ tà ma, mang lại tài lộc, may mắn.

Cây lưỡi hổ trồng chậu mang lại vẻ đẹp sang trọng bất ngờ

Cây lưỡi hổ có ý nghĩa Cầu chúc may mắn đến với bạn bè,đối tác, tân gia: an cư lạc nghiệp, năm mới tài lộc dồi dào.Theo phong thủy thì cây lưỡi hổ là cây cho người mệnh Thổ, vì người mệnh Thổ có khá nhiều sự lựa chọn loại cây cho mình trong cho ngày gặp may mắn, bởi họ rất hợp với màu đỏ, màu hồng còn màu vàng, vàng đất cũng khá phù hợp. Nên là Những người mệnh thổ, mộc, hỏa  khi sử dụng cây lưỡi hổ vừa đem lại may mắn lại giúp lọc không khí giúp môi trường trở nên trong lành hơn.Vị trí tốt nhất để bố trí cây lưỡi hổ trong nhà hoặc văn phòng phải là khu vực bát quái được nuôi dưỡng bởi yếu tố Mộc. Do đó, Đông, Đông Nam và Nam là những khu vực lý tưởng nhất để đặt cây lưỡi hổ

Khu vực phía Bắc có thể bị suy yếu bởi sự hiện diện quá mạnh mẽ của yếu tố Mộc (ví dụ như có quá nhiều cây xanh). Vì vậy, cách tốt nhất là tránh sắp xếp nhiều cây xanh ở phía Bắc. Điều này cũng áp dụng cho các khu vực Tây, Tây Nam, Tây Bắc và Đông Bắc. Chỉ nên trồng tối đa 2 – 3 cây xanh ở những khu vực bát quái này.

Cây lưỡi hổ luôn luôn là biểu tượng và giải pháp phong thủy tuyệt vời dành cho nhà ở hoặc nơi làm việc, bởi vì chúng mang đến nguồn khí/nguồn năng lượng mới mẻ, năng động vào trong từng không gian cụ thể. Khi chúng được chăm sóc khỏe mạnh, tươi tốt, được đặt đúng khu vực bát quái cũng như được trồng trong những chiếc chậu phù hợp, bạn có thể yên tâm chúng là phong thủy tốt.

Đôi khi, cây lưỡi hổ cũng được liệt vào danh sách cây phong thủy xấu. Thế nhưng, điều này không thực sự chính xác vì cây lưỡi hổ có thể mang lại năng lượng phong thủy rất hữu ích khi cần thiết cho từng khu vực cụ thể trong nhà hoặc chỗ làm việc. Thêm vào đó, loại cây này còn sở hữu năng lượng bảo vệ cực kỳ mạnh mẽ', 11, CAST(N'2018-06-20T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (4, N'Cây kim tiền', N'Assets/client/images/blog/cay-kim-tien.jpg', N'Cây kim tiền hay là kim phát tài phù hợp với gia chủ muốn mua cây đặt ở phòng khách, phòng hội họp, văn phòng công sở, nhà hàng, khách sạn, hoặc dùng làm quà tặng trong những dịp mừng lễ, tết, thăng chức, khai trương.Cây kim Tiền được coi là cây “Phát” – Chữ “kim” có nghĩa là Phát tài, “Tiền” có nghĩa là Phú quý, có tác dụng chiêu tài nên kim tiền rấy thích hợp làm quà tặng trong dịp khai trương cửa hàng, lễ Tết. Bởi quan niệm như vậy mà người ta thường treo lên cây những sợi chỉ đỏ hoặc đồng tiền vàng với ý nghĩa phát tài, phát lộc, trông rất đẹp mắt.

Điều tuyệt vời nhất khi trồng kim tiền đó là chúng ra hoa đại diện cho sự may mắn nhất của phong thuỷ. Người ta quan niệm Cây kim tiền nở hoa mang rất nhiều tài lộc và may mắn cho gia chủ.Theo sách phong thủy có ghi kim tiền là cây mộc, tồn tại và phát triển là thổ, dnước tưới hoặc dung dịch thủy sinh là thủy, cây trồng chậu hoặc bình thủy tinh là kim. Một cây đã kết hợp của các yếu tố phong thủy nên càng được ưa chuộng. Lá kim tiền có viền tròn mang tính âm phù hợp với trang trí hiện đại theo phong thủy đó là tính dương.

Để điều hòa cần các hình thức tròn trịa, âm tính, căng mọng và kim tiền đáp ứng được yêu cầu đó. Đặc biệt khi cây kim tiền đâm chồi nảy lộc, nở hoa sẽ đem lại nhiều may mắn, tiền tài đến cho gia chủ.Cây kim tiền hợp với tất cả các tuổi.Về vị trí, kim tiền nên đặt tại phòng khách ở cung Đông Nam - quẻ tốn - mộc là cung tài lộc hay cung phía Đông - quẻ chấn - ngũ hành thuộc mộc. Tuyệt đối không nên đặt kim tiền trong phòng ngủ. Đối với sảnh nhà, có thể đặt cây này nhưng nên có bệ cao, gần cửa ra vào. Tránh đặt cây đối diện cửa. Là cây dễ sống nên thích nghi với nhiều loài đất. Nhưng tốt nhất là chọn lựa đất màu mỡ, giàu mùn, tơi xốp và thoát nước nhanh. Chẳng hạn kết hợp pha trộn đất phù sa với 1/3 lượng trấu (có trấu hun thì càng tốt ) và trộn thêm xỉ than để cây kim tiền dễ dàng thoát nước ngoài ra trộn thêm một ít lân để kích thích sự ra rễ
.
Kim phát tài thích loại đất chua (pH từ 5,5-6,5). Bộ rễ của cây phát triễn rất mạnh, khi trồng trong chậu nên chú ý lựa chọn chậu cỡ lớn để cây sinh trưởng phát triển tốt. Tuy nhiên, kim phát tài rất nhạy cảm với đất cằn cỗi, vì vậy người chơi nên thường xuyên bón phân vào mùa xuân và mùa thu, khoảng 3 tuần/ lần vì đây là thời gian phát triển bộ lá mới và ra hoa của cây.

Tuy nhiên sau một thời gian trồng cây cũng nên thường xuyên bón thêm phân định kỳ 4 tuần/ 1 lần, ngoài ra 4-5 tháng nên thay đất hoặc xới xáo cho đất được tơi xốp để cây được sinh trưởng tốt hơn', 12, CAST(N'2018-08-19T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (5, N'Cây trúc bách hợp', N'Assets/client/images/blog/cay-truc-bach-hop.jpg', N'Cây trúc bách hợp là cây phong thủy, mang ý nghĩa hòa thuận, tốt lành, nên sẽ mang lại may mắn cho gia chủ.
Trúc bách hợp có kiểu dáng khác nhau, tùy thuộc vào ý định của gia chủ mà ta có thể chọn cây phù hợp để đặt trong nội thất. Những cây dang thon có thể đặc dọc lối đi. Nhưng cây tán xòa tròn đặt phòng khách. Những chậu cây nhỏ đặt trên bàn.Cây trúc bách hợp dùng làm cây nội thất, cây xanh văn phòng được trồng trong chậu nhỏ trang trí hay trong vườn đều rất đẹp. Điều hòa không khí và độ ẩm cho không gian khép kín.

Ý nghĩa:Cây trúc ngụ ý trời đất trường xuân, trời đất dài rộng. “Trúc” gần âm với  “chúc” có ý chỉ chúc phúc tốt đẹp. Theo phong thuỷ Trung Quốc thường cho rằng, trước và sau nhà có trúc là đem lại tốt lành cho cả gia đình.  Loại cây này tượng trưng cho sự mảnh mai, thanh nhã, rất thích hợp với  nhiều không gian và phong cách thiết kế khác nhau.

Phong thủy:Mang lại nhiều may mắn cho gia chủ.Cây Trúc Bách Hợp còn có tên gọi khác: Cây Phất Dụ Trúc. Tên khoa học cây Trúc Bách Hợp: Dracaena godseffiana Hort.

Thân, tán, lá: Cây bụi, phân nhánh nhiều, thân có sẹo do lá rụng để lại. Lá xếp hoa thị, dạng bầu dục thuôn nhọn ở đầu, gốc kéo bẹ ôm thân, mép nguyên, màu xanh bóng với có dải màu vàng tươi kéo dài từ gốc tới ngọn. Cây mọc thành bụi nhỏ, cao 0.5-2m, thân mảnh, phân nhánh nhỏ. Lá thuôn bầu dục, xếp đôi 1 hoặc 3 chiếc ở mỗi đốt, màu xanh đậm bóng, có các đốm vàng hay trắng không đều.

Hoa, quả, hạt: Hoa hiếm thấy, Hoa màu vành xanh nhạt. Quả mọng màu đỏ. Màu sắc và đốm trên lá đẹp, chịu được bóng.', 10, CAST(N'2018-05-09T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (6, N'Chọn chậu cho cây', N'Assets/client/images/blog/blog-footer-3.jpg', N'Việc chọn chậu cho cây là yếu tố quan trong để đảm bảo cho chậu cây luôn phát triển xanh tốt, chậu cây chọn trồng cây phải có đường kính chậu sao cho khoản cách của bầu cây cách vành chậu từ 10-15cm, việc này vừa đảm bảo khi chúng ta trồng cây vào chậu bầu cây sẽ không bị ép vào, cây sẽ không bị động rễ. Như vậy sức sống của cây sẽ không bị ảnh hưởng. Khoản cách này, giúp cho việc chăm sóc cây sau này cũng để dàng hơn, bởi vì theo tự nhiên thì cây sẽ còn tiếp tục phát triển tiếp chứ không ngưng lại ở đó.', 15, CAST(N'2018-05-09T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (7, N'Chọn đất cho chậu cây', N'Assets/client/images/blog/blog-footer-4.jpg', N'Đất chọn cho cây trồng phải vừa đủ, đây là loại đất đã được trộn sẵn bao gồm phân bò, sơ dừa tro trấu trộn. Hỗn hợp này sẽ đảm bảo đủ chất dinh dưỡng cho cây trong thời gian đầu khi mới trồng cây vào chậu. Tuy nhiên nếu chúng ta muốn chậu cây của bạn luôn xanh tươi và phát triền tốt chúng ta  phải bồ sung hỗn hợp này theo định kỳ 01 tháng/ lần, ngoài ra còn bổ sung thêm các loại phân hóa học có tác dụng dưỡng thân lá vá rễ cây với liều lượng được ghi chị tiết trên bao bì khi bạn mua tại Sài Gòn Hoa hay một cửa hàng chuyên về các loại phân bón cho cây trồng. Nếu kỹ càng hơn bạn có thề liên hệ với phòng kỹ thuật của Sài Gòn Hoa, tại đó các bác sĩ cây trồng sẽ hướng dẫn tận tình hơn.', 12, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (8, N'Tưới nước cho cây', N'Assets/client/images/blog/blog-footer-5.jpg', N'Nếu chậu cây chúng ta để ngoài sân chúng ta có thể tưới nước nhiều để đảm bảo nước thấm toàn bộ chậu cây, bạn cần tưới từ trên lá xuống, để cho cây sạch bụi để tăng độ quang hợp cho cây.
Việc tưới nước sau khi trồng cây này nhằm đảm độ ẩm cho cây.
 Chậu cây bạn để trong văn phòng hay nhà ở, hay không gian nội thất khác bạn phải để cây rút ráo nước rồi mới đem vào trong không gian bạn muốn trưng bày. Bạn nhớ chọn kèm theo một đĩa lót chậu để vừa đảm bảo thẩm mỹ cho chậu cây mà dĩa còn có tác dụng hứng nước để khỏi bị tràng ra nền nhà khi chúng ta sơ ý tưới một lượng nước quá nhiều vào chậu.', 14, CAST(N'2018-03-25T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (9, N'Vị trí đặt chậu cây', N'Assets/client/images/blog/blog-footer-6.jpg', N'Chậu cây xanh giúp tô điểm thêm không gian sống của bạn. Vị trí đặt chậu cây cũng cần phải đảm bảo là cây phải phù hợp với từng vị trí, chính vì thế mà khi chúng tạ chon cây và chậu cây cần phải chú ý đến chiều cao của chậu cây, tán lá của cây, màu sắc của lá cây có làm tôn không gian ở đó lên không, có bị che khuất các tầm nhìn quan trọng, hay vướng víu các lối đi lại gì không.Việc chọn vị trí cây bạn nên chú ý là phải có đủ ánh sáng để đảm bảo cho cây quan hợp và phát triển tốt,  nơi có nhiều ánh sáng chúng ta cũng dễ phát hiện ra sau bệnh hay các dấu hiệu cây bị yếu khác, như vây chúng ta sẽ có những biện pháp khắc phục kịp thời.Nếu những chậu cây thường xuyên ở các vị trí như phòng họp, phòng Sếp hay đi vắng, thường xuyên đóng kín, như vậy cây sẽ không quang hợp được, lá cây sẽ dần nhạt hơn, cây sẽ yếu đi và kém thẩm mỹ. Để duy trì sự phát triển cho cây chúng ta tạm thời đem cây ra khỏi khu vực đó, để cho cây có thời gian phục hồi từ từ, nên đem châu cây ra nơi có ánh sáng vừa đủ cho cây. Trong thời gian đó, bạn có thề bồ sung thêm dinh dưỡng cho cây bằng phân đất trồng,  tưới tắn, cắt tỉa cây để cho cây ra lá non.', 18, CAST(N'2018-06-29T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (10, N'Kĩ thuật trồng cây cảnh', N'Assets/client/images/blog/blog-footer-2.jpg', N'Thoát nước là yếu tố sống còn đối với cây cảnh trồng trên chậu.Cây ko dễ chết vì thiếu nước mà chết vì thừa nước .Cây ko chết vì đói mà chết vì bội thực chất bón .Cây đang yếu thì ko vội tẩm bổ .Chớ ham trộn nhiều chất bón và giá thể trồng cây, rễ cây mới trồng có thể bị sót làm chết cây . Chỉ khi cây trồng bén rễ mới được bón .Luôn pha loãng chất bón tùy theo tỉ lệ quy định của từng chất . Đừng nghĩ bón đậm là cây mau lớn .Cây trồng phải bén rễ , chắc gốc mới được uốn sửa .Tùng cối phải sau khi trồng ổn định một năm mới được cắt sửa , vặn xoắn : Và cũng nên làm vào mùa đông ở miền Bắc.Tùng la hán đánh lên trồng xuống nhiều lần trong thời gian ngắn thì tỉ lệ chết khá cao .Cây thả nước là nước , trồng đất là đất , đất nước lẫn lộn sẽ thành bùn làm thối rễ cây , cây sẽ yếu và dễ chết : LuxBonsai cảm ơn tác giả đã nhắc nhở. LuxBonsai cũng suýt làm cây Thiên nga ở trong bùn.Chớ quên tháo gỡ dây kim loại quấn cây khi cành hay thân đã thành hình: Phổ biến ở các nhà vườn, hàng chợ là quên tháo dây.Thời tiết luôn là bạn đồng hành của hoa, cây cảnh, nên tuân thủ thời vụ và thời tiết .
Phải quan sát cây hàng ngày , nếu bỏ bẵng dù chỉ vài ngày có thể ko cứu vãn được nữa .', 20, CAST(N'2018-07-31T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Avatar], [Description], [View], [DatePost], [Priority], [EmployeeId]) VALUES (11, N'Nghệ thuật tạo hình cây cảnh', N'Assets/client/images/blog/blog-footer-1.jpg', N'Chưa có ý tưởng nghệ thuật cũng như chưa có một ý đồ xây dựng hình tượng nghệ thuật , thì chưa vội cắt sửa cây phôi , hãy kiên trì tìm tòi , suy ngẫm , đừng cắt sửa , uốn kéo vu vơ: Ý tác giả cho rằng cần suy nghĩ cẩn thận.Một cây phôi ko phải chỉ có duy nhất một phương án tạo hình: Ý tác giả cho rằng sẽ có nhiều phương án khác nhau dưới góc độ nghệ thuật khác nhau. Không bằng lòng với cách trồng cây sẵn có , mà luôn xoay trở xem còn cách trồng nào hay hơn , dựa trên ý tưởng sáng tác cũng như ý đồ xây dựng hình tượng nghệ thuật : Tâm lý tìm tòi sáng tạo của người làm nghệ thuật.Không thỏa mãn với hình tượng nghệ thuật đã có mà luôn suy nghĩ tìm tòi để sáng tạo hình tượng mới hơn : Ý tác giả đó là luôn thử nghiệm những kiểu dáng khác nhau.Cần kết hợp chặt chẽ giữ nghệ thuật mảng và nghệ thuật đường nét .: Nghệ thuật mảng và nghệ thuật đường nét.Để tạo được vẻ cổ lão đồng bộ , cần làm lão hóa cả thân cây và cành , chi.Đừng tưởng bộ rễ chằng chịt , rối rắm là nghệ thuật: Có nghĩa bộ rễ cũng phải tạo nên đường nét. Ít chi tiết nhất mà hiệu quả nghệ thuật cao nhất thì nên lựa chọn : Đơn giản, thiết kế đơn giản sẽ giúp người xem dễ nhận ra.', 22, CAST(N'2018-08-27T00:00:00.000' AS DateTime), 3, 2)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (1, N'Cây cảnh sen đá', N'~/Assets/client/images/icon/cay-canh-sen-da.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (2, N'Cây cảnh để bàn', N'~/Assets/client/images/icon/cay-canh-de-ban.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (3, N'Cây cảnh văn phòng', N'~/Assets/client/images/icon/cay-canh-van-phong.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (4, N'Cây cảnh trong nhà', N'~/Assets/client/images/icon/cay-canh-trong-nha.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (5, N'Cây thủy sinh', N'~/Assets/client/images/icon/cay-thuy-sinh.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (6, N'Cây cảnh phong thủy', N'~/Assets/client/images/icon/cay-canh-phong-thuy.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (7, N'Xương rồng cảnh', N'~/Assets/client/images/icon/xuong-rong-canh.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (8, N'Tiểu cảnh trang trí', N'~/Assets/client/images/icon/tieu-canh-trang-tri.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (9, N'Terrarium', N'~/Assets/client/images/icon/terrarium.png')
INSERT [dbo].[Categories] ([Id], [Name], [Avatar]) VALUES (10, N'Phụ kiện', N'~/Assets/client/images/icon/phu-kien.png')

SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Phone], [Address], [TotalMoney]) VALUES (24, N'Đạt', N'kidgiangho1996@gmail.com', N'123', N'0934087969', N'Hà Nội', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Phone], [Address], [TotalMoney]) VALUES (25, N'Boss', N'abcde@gmail.com', N'123', N'123456789', N'fgfhgjhgj', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Phone], [Address], [TotalMoney]) VALUES (26, NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Phone], [Address], [TotalMoney]) VALUES (27, N'King', N'kidgiangho1998@gmail.com', N'1234', N'223456754433', N'dsfdfggfhgh', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Phone], [Address], [TotalMoney]) VALUES (28, N'Chí mén', N'trumtintac1261996@gmail.com', N'123', N'244564554133', N'Đà Nẵng', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Phone], [Address], [TotalMoney]) VALUES (29, N'Hà', N'nguyenha11097@gmail.com', N'123', N'354613365466', N'ĐN', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Password], [Phone], [Address], [TotalMoney]) VALUES (30, N'dadsada', N'kidgiangho1990@gmail.com', N'123', N'15616165', N'dsadasd', CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Deliveries] ON 

INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (1, N'dcdz', N'fds', N'4456', N'fsfds')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (2, N'Đại tỉ', N'abcd@gmail.com', N'12316546', N'xgfjdgfdiu')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (3, N'gfffffj', N'xyz@gmail.com', N'113', N'bvjjhfd')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (4, N'đfsdfgfg', N'edd@gmial.com', N'113', N'hbkjfghf')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (5, N'nbnbkgjfnvkjv', N'accc@gmail.com', N'2134567', N'vbkxvbkdf')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (6, N'Trần Đại', N'kidgiangho1998@gmail.com', N'15412316546664', N'Đà Nẵng')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (7, N'Traafi Đại', N'kidgiangho1998@gmail.com', N'4543133456', N'ĐN')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (8, N'Boss', N'kidgiangho1998@gmail.com', N'345676546765', N'ĐN')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (9, N'Lord', N'kidgiangho1998@gmail.com', N'346545666', N'dsdsadsa')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (10, N'Trí', N'abc@gmail.com', N'4541345646464', N'HN')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (11, N'Đạt', N'ptdat061296@gmail.com', N'012547862', N'Đà Nẵng')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (12, N'Đạt', N'ptdat061296@gmail.com', N'0231459742', N'Đà Nẵng')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (13, N'Đạt', N'ptdat061296@gmail.com', N'1223211100', N'Đà Nẵng')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (14, N'Đạt', N'ptdat061296@gmail.com', N'0122456722', N'Đà Nẵng')
INSERT [dbo].[Deliveries] ([Id], [Name], [Email], [Phone], [Address]) VALUES (15, N'Đạt', N'ptdat061296@gmail.com', N'011231353544', N'HN')
SET IDENTITY_INSERT [dbo].[Deliveries] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [UserName], [Password], [FullName], [Phone], [Email], [Address], [LevelId], [Status]) VALUES (1, N'admin', N'123456', N'Admin', N'666', N'admin@gmail.com', N'Hà Nội', 1, 1)
INSERT [dbo].[Employees] ([Id], [UserName], [Password], [FullName], [Phone], [Email], [Address], [LevelId], [Status]) VALUES (2, N'employee', N'123456', N'Nguyễn Văn A', N'012223344', N'nva@gmail.com', N'Đà Nẵng', 2, 1)
INSERT [dbo].[Employees] ([Id], [UserName], [Password], [FullName], [Phone], [Email], [Address], [LevelId], [Status]) VALUES (3, N'employee2', N'123456', N'Nguyễn Văn B', N'011234568', N'nvb@gmail.com', N'Hà Nội', 2, 0)
INSERT [dbo].[Employees] ([Id], [UserName], [Password], [FullName], [Phone], [Email], [Address], [LevelId], [Status]) VALUES (4, N'shipper', N'123456', N'Trần Văn A', N'1021400064', N'tva@gmail.com', N'TP Hồ Chí Minh', 3, 1)
INSERT [dbo].[Employees] ([Id], [UserName], [Password], [FullName], [Phone], [Email], [Address], [LevelId], [Status]) VALUES (5, N'shipper2', N'123456', N'Trần Văn B', N'0934087969', N'tvb@gmail.com', N'Hà Nội', 3, 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (1, 2, N'2.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (2, 3, N'3.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (3, 4, N'4.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (4, 1, N'1.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (5, 5, N'5.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (6, 6, N'6.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (7, 7, N'7.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (8, 8, N'8.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (9, 9, N'9.jpg     ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (10, 10, N'10.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (11, 11, N'11.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (12, 12, N'12.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (13, 13, N'13.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (14, 14, N'14.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (15, 15, N'15.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (16, 16, N'16.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (17, 17, N'17.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (18, 18, N'18.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (19, 19, N'19.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (20, 20, N'20.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (21, 21, N'21.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (22, 22, N'22.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (23, 23, N'23.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (24, 24, N'24.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (25, 25, N'25.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (26, 26, N'26.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (27, 27, N'27.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (28, 28, N'28.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (29, 29, N'29.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (30, 30, N'30.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (31, 31, N'31.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (32, 32, N'32.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (33, 33, N'33.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (34, 34, N'34.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (35, 35, N'35.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (36, 36, N'36.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (37, 37, N'37.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (38, 38, N'38.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (39, 39, N'39.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (40, 40, N'40.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (41, 41, N'41.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (42, 42, N'42.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (43, 43, N'43.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (44, 44, N'44.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (45, 45, N'45.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (46, 46, N'46.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (47, 47, N'47.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (48, 48, N'48.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (49, 49, N'49.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (50, 50, N'50.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (51, 51, N'51.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (52, 52, N'52.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (53, 53, N'53.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (54, 54, N'54.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (55, 55, N'55.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (56, 56, N'56.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (57, 57, N'57.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (58, 58, N'58.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (59, 59, N'59.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (60, 60, N'60.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (61, 61, N'61.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (62, 62, N'62.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (63, 63, N'63.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (64, 64, N'64.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (65, 65, N'65.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (66, NULL, N'66.jpg    ')
INSERT [dbo].[Images] ([Id], [ProductId], [Url]) VALUES (67, NULL, N'7.jpg     ')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Levels] ON 

INSERT [dbo].[Levels] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Levels] ([Id], [Name]) VALUES (2, N'Employee')
INSERT [dbo].[Levels] ([Id], [Name]) VALUES (3, N'Shipper')
INSERT [dbo].[Levels] ([Id], [Name]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[Levels] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1, 23, 3, CAST(100000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (2, 23, 4, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (3, 27, 51, CAST(130000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (4, 27, 65, CAST(30000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (5, 29, 48, CAST(100000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (6, 29, 47, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (7, 29, 53, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (8, 30, 65, CAST(30000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (9, 30, 53, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (10, 31, 47, CAST(90000 AS Decimal(18, 0)), 2, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (11, 31, 50, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (12, 31, 65, CAST(30000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (13, 32, 49, CAST(160000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (14, 32, 47, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (15, 32, 7, CAST(90000 AS Decimal(18, 0)), 2, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (16, 33, 50, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (17, 33, 47, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (18, 34, 49, CAST(160000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (19, 34, 50, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (20, 35, 42, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (21, 35, 46, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (22, 35, 45, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (23, 36, 50, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (24, 36, 49, CAST(160000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (25, 37, 50, CAST(90000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (26, 38, 50, CAST(90000 AS Decimal(18, 0)), 4, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (27, 39, 49, CAST(160000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (28, 40, 52, CAST(100000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (29, 40, 51, CAST(130000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (30, 41, 50, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (31, 41, 49, CAST(110000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (32, 42, 1, CAST(130000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (33, 43, 48, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (34, 43, 51, CAST(80000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (35, 44, 47, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (36, 45, 47, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (37, 46, 10, CAST(130000 AS Decimal(18, 0)), 6, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (38, 46, 47, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (39, 46, 48, CAST(50000 AS Decimal(18, 0)), 4, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (40, 47, 47, CAST(40000 AS Decimal(18, 0)), 2, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (41, 47, 48, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (42, 48, 50, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (43, 48, 52, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (44, 49, 47, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (45, 50, 47, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1045, 1050, 3, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1046, 1050, 48, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1047, 1050, 47, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1048, 1051, 65, CAST(25000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1049, 1051, 51, CAST(80000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1050, 1052, 53, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1051, 1053, 50, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1052, 1053, 49, CAST(110000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1053, 1053, 47, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1054, 1054, 50, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1055, 1054, 49, CAST(110000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1056, 1054, 48, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1057, 1055, 50, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1058, 1055, 49, CAST(110000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1059, 1055, 48, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1060, 1056, 50, CAST(40000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1061, 1056, 49, CAST(110000 AS Decimal(18, 0)), 1, 0, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Discount], [Tax]) VALUES (1062, 1056, 48, CAST(50000 AS Decimal(18, 0)), 1, 0, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (23, N'1534566304511232420', CAST(N'2018-08-18' AS Date), 24, NULL, 0, 0, 2, 2, 4, CAST(190000 AS Decimal(18, 0)), 4, N'Hàng không đạt yêu cầu', CAST(N'2019-11-26' AS Date))
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (27, N'1534610019065272480', CAST(N'2018-08-18' AS Date), 24, 7, 0, 0, 2, 2, 4, CAST(160000 AS Decimal(18, 0)), 3, NULL, CAST(N'2019-11-26' AS Date))
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (29, N'1534611651050292473', CAST(N'2018-08-19' AS Date), 24, 8, 0, 0, 1, 2, 4, CAST(280000 AS Decimal(18, 0)), 3, NULL, CAST(N'2019-11-26' AS Date))
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (30, N'1535020327667302458', CAST(N'2018-08-23' AS Date), 24, 9, 0, 0, 2, 2, 4, CAST(120000 AS Decimal(18, 0)), 2, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (31, N'1535285220378312496', CAST(N'2018-08-26' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(300000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (32, N'1535287836888322455', CAST(N'2018-08-26' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(430000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (33, N'131805013341730989332459', CAST(N'2018-09-04' AS Date), 24, 10, 0, 0, 1, NULL, NULL, CAST(180000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (34, N'131805026444791918342431', CAST(N'2018-09-04' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(250000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (35, N'131805027598483536352472', CAST(N'2018-09-04' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(270000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (36, N'131805030824193413362464', CAST(N'2018-09-04' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(250000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (37, N'131805033686311169372437', CAST(N'2018-09-04' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(90000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (38, N'131805038574098675382487', CAST(N'2018-09-04' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(360000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (39, N'131805041258001460392421', CAST(N'2018-09-04' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(160000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (40, N'131805045094248016402457', CAST(N'2018-09-04' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(230000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (41, N'132178663840281781412472', CAST(N'2019-11-10' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(150000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (42, N'132178665766455799422425', CAST(N'2019-11-10' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(130000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (43, N'132178668579717827432493', CAST(N'2019-11-10' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(130000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (44, N'132178671814546114442441', CAST(N'2019-11-10' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(40000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (45, N'132178672366486855452433', CAST(N'2019-11-10' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(40000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (46, N'132179362863708473462481', CAST(N'2019-11-11' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(1020000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (47, N'132179366455328045472418', CAST(N'2019-11-11' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(130000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (48, N'132179370155398519482489', CAST(N'2019-11-11' AS Date), 24, NULL, 0, 0, 1, NULL, NULL, CAST(90000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (49, N'132179372275804533492457', CAST(N'2019-11-11' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(40000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (50, N'132179545451078230502448', CAST(N'2019-11-11' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(40000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (1050, N'13219301967881499210502422', CAST(N'2019-11-27' AS Date), 24, NULL, 0, 0, 1, 2, 4, CAST(140000 AS Decimal(18, 0)), 3, NULL, CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (1051, N'13220283992444163610512427', CAST(N'2019-12-08' AS Date), 24, NULL, 0, 0, 2, NULL, NULL, CAST(105000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (1052, N'13220901620811129610522439', CAST(N'2019-12-15' AS Date), 24, 11, 0, 0, 2, NULL, NULL, CAST(40000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (1053, N'13220901935639504410532449', CAST(N'2019-12-15' AS Date), 24, 12, 0, 0, 2, NULL, NULL, CAST(190000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (1054, N'13220902262772136510542426', CAST(N'2019-12-15' AS Date), 24, 13, 0, 0, 2, NULL, NULL, CAST(200000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (1055, N'13220902637830884910552430', CAST(N'2019-12-15' AS Date), 24, 14, 0, 0, 2, NULL, NULL, CAST(200000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderCode], [OrderDate], [CustomerId], [DeliveryId], [Discount], [Tax], [PaymentMethodId], [ProcessingEmployeeId], [ShipperEmployeeId], [Total], [OrderStatusId], [CancelReason], [DeliveryDate]) VALUES (1056, N'13220903334019247210562493', CAST(N'2019-12-16' AS Date), 24, 15, 0, 0, 2, NULL, NULL, CAST(200000 AS Decimal(18, 0)), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([Id], [Status]) VALUES (1, N'Đang chờ')
INSERT [dbo].[OrderStatuses] ([Id], [Status]) VALUES (2, N'Đang giao')
INSERT [dbo].[OrderStatuses] ([Id], [Status]) VALUES (3, N'Đã giao')
INSERT [dbo].[OrderStatuses] ([Id], [Status]) VALUES (4, N'Huỷ đơn hàng')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([Id], [Name]) VALUES (1, N'Chuyển khoản')
INSERT [dbo].[PaymentMethods] ([Id], [Name]) VALUES (2, N'Ship Code')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (1, N'Cặp đôi hoàn hảo', 1, CAST(130000 AS Decimal(18, 0)), N'Chậu sen đá cặp đôi hoàn hảo gồm 2 sản phẩm, quý khách có thể tự lựa chọn cây và chậu, bên cây cảnh sẽ trang trí một cách hợp lý và đẹp nhất cho quý khách. Cây phù hợp để bàn làm việc, bàn học, của sổ, trang trí quán cà phê…', 100, 101, 1, 0, 1, N'~/Assets/client/images/product/cap-doi-hoan-hao.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (2, N'Cây sen đá đất trắng', 1, CAST(50000 AS Decimal(18, 0)), N'Cây Sen Đá Đất Trắng có đặc điểm gần như giống hoàn toàn với cây Sen Đá Đất, có điều cây Sen Đá Đất thì lá có màu xanh và bao phủ là một lớp phấn mỏng còn Sen Đá Đất Trắng lá có màu trắng và cũng được bao phủ thêm một lớp phấn mỏng màu trắng nên nhìn lá có màu trắng rất mịn màng. Vì cây có màu trắng nên rất phù hợp với người mệnh kim và mệnh thủy giúp tăng tài lộc cho những người ở bản mệnh này và thích Sen Đá. Cây phù hợp để trang trí bàn làm việc, bàn cà phê, quần thu ngân…', 100, 153, 1, 0, 1, N'~/Assets/client/images/product/cay-sen-da-dat-trang.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (3, N'Sedum dạ quang', 1, CAST(50000 AS Decimal(18, 0)), N'Sen đá sedum dạ quang phù hợp để bàn, trang trí quán cà phê, góc học tập, trồng với tiểu cảnh, terrarium…Cây mang ý nghĩa cho một tình yêu, tình bạn vĩnh cửu không bao giờ phai nhòa dù có khó khăn như màn đêm bao phủ không còn thấy đường về thì vẫn có người dẫn lối để có thể dễ dàng vượt qua...', 99, 202, 1, 0, 1, N'~/Assets/client/images/product/sedum-da-quang.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (4, N'Sedum hoa hồng', 1, CAST(40000 AS Decimal(18, 0)), N'Sedum hoa hồng thuộc dòng sen đá phù hợp để bàn, trồng kèm với tiểu cảnh, trang trí quán cà phê, bàn học, làm việc…', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/sedum-hoa-hong.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (5, N'Sen đá 3 màu', 1, CAST(40000 AS Decimal(18, 0)), N'Sen đá 3 màu là một loại sen có rất nhiều màu sắc và bắt mắt cây thường cao khoảng tầm >10 cm, có các cây con bên hông mọc phát triển như cây chính. Cây mang ý nghĩa cho sự sung túc, đuề huề và đầy đủ.', 100, 51, 1, 0, 1, N'~/Assets/client/images/product/sen-da-3-mau.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (6, N'Sen đá 3D', 1, CAST(40000 AS Decimal(18, 0)), N'Cây sen đá 3D mang ý nghĩa phong thủy cho một tình yêu và một tình bạn vĩnh cửu, không đổi thay theo thời gian. Cây phù hợp để bàn làm việc, trang trí góc học tập, quán cà phê… Cây có cách chăm sóc khá đơn giản.', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/sen-da-3d.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (7, N'Sen đá bắp cải', 1, CAST(40000 AS Decimal(18, 0)), N'Sen đá bắp cải có ý nghĩa cho một tình bạn, tình yêu vĩnh cửu theo thời gian. Ngoài ra về phong thủy nó còn mang ý nghĩa sung túc và đầm ấm trong gia đình. Cây sen bắp cải phù hợp để trang trí khách sạn, quán cà phê, bàn làm việc, góc học tập, cửa sổ….', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/sen-da-bap-cai.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (8, N'Sen đá bèo viền hồng', 1, CAST(60000 AS Decimal(18, 0)), N'Cây Sen Đá Bèo Viền Hồng mang ý nghĩa cho một tình yêu, tình bạn vĩnh cửu bền vững mãi theo thời gian, nếu ai thích cây theo phong thủy thì cây phù hợp với người mệnh hỏa vì bản thân cây chỉ có 2 màu là màu xanh ( màu của mệnh mộc, mộc sinh hỏa ) và màu đỏ, hồng ( màu của mệnh hỏa hòa hợp ). Ngoài ra cây còn có tác dụng hút bức xạ máy tính. Cây phù hợp làm cây cảnh để bàn, trang trí quán cà phê, trang trí các góc nhỏ như kệ sách, quầy thu ngân…', 100, 150, 1, 0, 1, N'~/Assets/client/images/product/sen-da-beo-vien-hong.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (9, N'Cẩm nhung Fittonia', 2, CAST(80000 AS Decimal(18, 0)), N'Cây cẩm nhung Fittonia có màu đỏ, trắng, hồng…Cây còn gọi là lá may mắn, dễ sống và dễ chăm sóc. Cây phù hợp làm cây cảnh để bàn, trồng terrarium, tiểu cảnh, trang trí quán cà phê, làm quà tặng…', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/cam-nhung-fittonia.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (10, N'Cặp đôi hoàn hảo', 2, CAST(130000 AS Decimal(18, 0)), N'Chậu sen đá cặp đôi hoàn hảo gồm 2 sản phẩm, quý khách có thể tự lựa chọn cây và chậu, bên cây cảnh sẽ trang trí một cách hợp lý và đẹp nhất cho quý khách. Cây phù hợp để bàn làm việc, bàn học, của sổ, trang trí quán cà phê…', 100, 100, 1, 0, 1, N'~/Assets/client/images/product/cap-doi-hoan-hao.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (11, N'Cau tiểu trâm', 2, CAST(80000 AS Decimal(18, 0)), N'Cây Câu Tiểu Trâm hay còn gọi là cau may mắn, cây ưa mát không cần nhiều ánh sáng vẫn có thể phát triển, Cau Tiểu Trâm có khả năng hút các chất khí độc và lọc sạch không ý. Cây mang ý nghĩa may mắn và tài lộc trong phong thủy.', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/cau-tieu-tram.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (12, N'Cây hồng môn', 2, CAST(170000 AS Decimal(18, 0)), N'Cây Hồng Môn tượng trưng cho tình yêu và lòng hiếu khách, cây phù hợp để bày phòng khách, quầy lễ tân, nơi nhiều người thường xuyên qua lại, hoặc để trang trí nội thất đều rất hợp.', 100, 150, 1, 0, 1, N'~/Assets/client/images/product/cay-hong-mon.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (13, N'Cây kim ngân', 2, CAST(160000 AS Decimal(18, 0)), N'Cây kim ngân hay còn gọi là cây thắt bím, cây bím tóc phù hợp với gia chủ muốn mua cây đặt ở phòng khách, phòng hội họp, văn phòng công sở, nhà hàng, khách sạn, hoặc dùng làm quà tặng trong những dịp mừng lễ, tết, thăng chức, khai trương. Các cây nhỏ có thể để bàn ngoài tác dụng đem lại tài lộc nó lại còn có thể đuổi muỗi.', 100, 150, 1, 0, 1, N'~/Assets/client/images/product/cay-kim-ngan.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (14, N'Cây kim ngân thuỷ sinh', 2, CAST(180000 AS Decimal(18, 0)), N'Cây kim ngân thủy sinh hay còn có tên gọi khác là money tree ( cây tiền ) là một trong những cây số 1 về phong thủy. Cây phù hợp để bàn làm việc, văn phòng, trang trí quán cà phê, bàn lễ tân…', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/cay-kim-ngan-thuy-sinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (15, N'Cây kim tiền', 2, CAST(150000 AS Decimal(18, 0)), N'Cây kim tiền hay là kim phát tài phù hợp với gia chủ muốn mua cây đặt ở phòng khách, phòng hội họp, văn phòng công sở, nhà hàng, khách sạn, hoặc dùng làm quà tặng trong những dịp mừng lễ, tết, thăng chức, khai trương….', 100, 100, 1, 0, 1, N'~/Assets/client/images/product/cay-kim-tien.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (16, N'Cây lan quân tử', 2, CAST(200000 AS Decimal(18, 0)), N'Cây Lan Quân Tử được coi là cây vượng tài đối với người tuổi Mùi. Người cầm tinh con Dê không để ý chuyện tiền tài, cũng không ham muốn kiếm tiền nên họ ít khi cố gắng để làm việc, vì vậy đương nhiên không có khả năng phát tài. Bạn có thể đặt một chậu Lan Quân Tử tại góc bên phải của bức tường đối diện ghế sô-pha, để tăng vận quý nhân trợ giúp bạn trên con đường phát tài.', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/cay-lan-quan-tu.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (17, N'Cây lưỡi hổ', 3, CAST(150000 AS Decimal(18, 0)), N'Cây lưỡi hổ có tác dụng thanh lọc không khí, hấp thụ chất gây ô nhiễm, cải thiện không gian sống, vào ban đêm cây nhả oxi nên rất phù hợp để phòng ngủ. Cây mang ý nghĩa phong thủy trừ tà xua đuổi ma quỹ, chống lại sự bỏ bùa để đem lại may mắn và tài lộc cho gia chủ. Cây phù hợp để bàn, để trong nhà, phòng ngủ…', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/cay-luoi-ho.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (18, N'Cây may mắn tài lộc', 3, CAST(150000 AS Decimal(18, 0)), N'Cây May Mắn Tài Lộc giúp cho gia chủ làm ăn thuận lợi, sáng suốt trong việc đưa ra những quyết định. Cây phù hợp làm quà tặng, cây để bàn, trang trí…', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-may-man-tai-loc.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (19, N'Cây ngọc ngân', 3, CAST(180000 AS Decimal(18, 0)), N'Cây Ngọc Ngân hay còn có tên là cây Valentine trong tình cảm nó được đại diện cho tình yêu, nó sẽ là một món quà ý nghĩa đối với các cặp đôi. Nếu đặt ở văn phòng, bàn làm việc, trong nhà thì Ngọc Ngân sẽ mang đến sự may mắn và bổng lộc cho gia chủ.', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-ngoc-ngan.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (20, N'Cây ngọc ngân thuỷ sinh', 3, CAST(200000 AS Decimal(18, 0)), N'Với chiếc bình thủy tinh giúp lộ ra bộ rễ trắng, khiến cây Ngọc Ngân càng nổi bật và sạch sẽ. Cây phù hợp để bàn, để trong nhà, trang trí quán cà phê, bàn tiếp khách…Mang đến cho gia chủ sự may mắn và bổng lộc', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-ngoc-ngan-thuy-sinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (21, N'Cây ngũ gia bì', 3, CAST(150000 AS Decimal(18, 0)), N'Cây Ngũ Gia Bì giúp gia chủ phát triển vững vàng, cũng có thể ổn định tài vận, giữ được tiền tài. Cây phù hợp để bàn, trang trí nội thất, bàn làm việc, quán cà phê, bàn lễ tân…', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-ngu-gia-bi.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (22, N'Cây phát tài', 3, CAST(150000 AS Decimal(18, 0)), N'Cây phát tài hay còn gọi là cây thiết mộc lan, phát tài khúc với ý nghĩa mang lại may mắn cho gia chủ trong cuộc sống và công việc. Sản phẩm phù hợp với gia chủ muốn mua cây phòng khách, phòng hội họp, văn phòng công sở, nhà hàng, khách sạn, hoặc dùng làm quà tặng trong những dịp mừng lễ, tết, thăng chức, khai trương…Hoa của cây phát tài rất thơm, một hương thơm dịu', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-phat-tai.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (23, N'Cây phát tài búp sen', 3, CAST(160000 AS Decimal(18, 0)), N'Cây Phát Tài Búp Sen được tượng trưng cho sự thanh khiết, thánh thiện, cây có ý nghĩa phong thủy mang đến tài lộc, may mắn và thành công cho gia chủ, vì vậy Phát Tài Búp Sen rất phù hợp làm quà mừng tân gia, để trên bàn làm việc, bàn uống nước, văn phòng…', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-phat-tai-bup-sen.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (24, N'Cây phú quý', 3, CAST(180000 AS Decimal(18, 0)), N'Cây Phú Quý có ý nghĩa phong thủy mang đến cho gia chủ sự may mắn, giàu sang và phú quý. Cây phù hợp để trang trí quán cà phê, góc nhỏ, sảnh, khách sạn…', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/cay-phu-quy.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (25, N'Cây may mắn tài lộc', 4, CAST(150000 AS Decimal(18, 0)), N'Cây May Mắn Tài Lộc giúp cho gia chủ làm ăn thuận lợi, sáng suốt trong việc đưa ra những quyết định. Cây phù hợp làm quà tặng, cây để bàn, trang trí…', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/cay-may-man-tai-loc.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (26, N'Cây ngọc ngân', 4, CAST(180000 AS Decimal(18, 0)), N'Cây Ngọc Ngân hay còn có tên là cây Valentine trong tình cảm nó được đại diện cho tình yêu, nó sẽ là một món quà ý nghĩa đối với các cặp đôi. Nếu đặt ở văn phòng, bàn làm việc, trong nhà thì Ngọc Ngân sẽ mang đến sự may mắn và bổng lộc cho gia chủ.', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-ngoc-ngan.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (27, N'Cây ngọc ngân thuỷ sinh', 4, CAST(200000 AS Decimal(18, 0)), N'Với chiếc bình thủy tinh giúp lộ ra bộ rễ trắng, khiến cây Ngọc Ngân càng nổi bật và sạch sẽ. Cây phù hợp để bàn, để trong nhà, trang trí quán cà phê, bàn tiếp khách…Mang đến cho gia chủ sự may mắn và bổng lộc', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/cay-ngoc-ngan-thuy-sinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (28, N'Cây ngũ gia bì', 4, CAST(150000 AS Decimal(18, 0)), N'Cây Ngũ gia bì giúp gia chủ phát triển vững vàng, cũng có thể ổn định tài vận, giữ được tiền tài. Cây phù hợp để bàn, trang trí nội thất, bàn làm việc, quán cà phê, bàn lễ tân…', 100, 301, 1, 0, 1, N'~/Assets/client/images/product/cay-ngu-gia-bi.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (29, N'Cây phát tài búp sen', 4, CAST(160000 AS Decimal(18, 0)), N'Cây phát tài búp sen được tượng trưng cho sự thanh khiết, thánh thiện, cây có ý nghĩa phong thủy mang đến tài lộc, may mắn và thành công cho gia chủ, vì vậy cây phát tài búp sen rất phù hợp làm quà mừng tân gia, để trên bàn làm việc, bàn uống nước, văn phòng…', 100, 400, 1, 0, 1, N'~/Assets/client/images/product/cay-phat-tai-bup-sen.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (30, N'Cây phú quý', 4, CAST(180000 AS Decimal(18, 0)), N'Cây phú quý có ý nghĩa phong thủy mang đến cho gia chủ sự may mắn, giàu sang và phú quý. Cây phù hợp để trang trí quán cà phê, góc nhỏ, sảnh, khách sạn…', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/cay-phu-quy.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (31, N'Cây phú quý thuỷ sinh', 4, CAST(200000 AS Decimal(18, 0)), N'Cây Phú Quý thủy sinh rất phù hợp để trong văn phòng, trang trí nhà cửa, quán cà phê. Được đựng trong bình thủy tinh nên cây rất sạch sẽ. Cây phù hợp với người mệnh thổ và mệnh hỏa. Cây mang ý nghĩa phong thủy mang đến phú quý, may mắn và giàu sang cho gia chủ.', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-phu-quy-thuy-sinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (32, N'Cây thường xuân', 4, CAST(150000 AS Decimal(18, 0)), N'Cây Thường Xuân mang ý nghĩa phong thủy xua đuổi tà ma, xóa tan âm khí, vượng dương khí mang đến bình an và may mắn cho gia chủ. Cây phù hợp để trang trí quán cà phê, nhà hàng, khách sạn, phòng họp…', 100, 400, 1, 0, 1, N'~/Assets/client/images/product/cay-thuong-xuan.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (33, N'Cây lan Ý thuỷ sinh', 5, CAST(190000 AS Decimal(18, 0)), N'Cây Lan Ý thủy sinh có tác dụng thanh lọc không khí, hấp thụ các chất gây ung thư như formaldehyde, benzen và trichloroethylene, ngoài ra nó còn có khả năng giúp hấp thụ các bức xạ nhân tạo phát ra từ máy tính, tivi, lò vi sóng, đồng hồ điện tử…Cây phù hợp để bàn làm việc, trang ý quán cà phê, bàn uống nước….', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/cay-lan-y-thuy-sinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (34, N'Cây ngọc ngân thuỷ sinh', 5, CAST(200000 AS Decimal(18, 0)), N'Với chiếc bình thủy tinh giúp lộ ra bộ rễ trắng, khiến cây Ngọc Ngân càng nổi bật và sạch sẽ. Cây phù hợp để bàn, để trong nhà, trang trí quán cà phê, bàn tiếp khách…Mang đến cho gia chủ sự may mắn và bổng lộc', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/cay-ngoc-ngan-thuy-sinh-chau-thuy-tinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (35, N'Cây phát tài búp sen', 5, CAST(160000 AS Decimal(18, 0)), N'Cây Phát Tài Búp Sen được tượng trưng cho sự thanh khiết, thánh thiện, cây có ý nghĩa phong thủy mang đến tài lộc, may mắn và thành công cho gia chủ, vì vậy Phát Tài Búp Sen rất phù hợp làm quà mừng tân gia, để trên bàn làm việc, bàn uống nước, văn phòng…', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/cay-phat-tai-bup-sen-chau-thuy-tinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (36, N'Cây phú quý thuỷ sinh', 5, CAST(200000 AS Decimal(18, 0)), N'Cây Phú Quý thủy sinh rất phù hợp để trong văn phòng, trang trí nhà cửa, quán cà phê. Được đựng trong bình thủy tinh nên cây rất sạch sẽ. Cây phù hợp với người mệnh thổ và mệnh hỏa. Cây mang ý nghĩa phong thủy mang đến phú quý, may mắn và giàu sang cho gia chủ.', 100, 350, 1, 0, 1, N'~/Assets/client/images/product/cay-phu-quy-thuy-sinh-chau-su.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (37, N'Cỏ đồng tiền', 5, CAST(150000 AS Decimal(18, 0)), N'Cây cỏ Đồng Tiền thủy sinh có ý nghĩa phong thủy giúp tài vận thăng tiến, đồng thời cũng có thể giúp năng lực phân tích cá nhân, làm bạn mạnh mẽ hơn, làm việc quyết đoán hơn, đặc biệt cây giúp gia chủ nắm bắt tốt thời cơ, không bỏ qua cơ hội kiếm tiền.', 100, 154, 1, 0, 1, N'~/Assets/client/images/product/co-dong-tien.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (38, N'Xương rồng kim hổ thuỷ sinh', 5, CAST(110000 AS Decimal(18, 0)), N'Xương rồng kim hổ thủy sinh có ý nghĩa phong thủy giúp trừ tà, phù hợp làm quà tặng, trang trí bàn làm việc, bàn học, để cạnh máy tính giúp hút bức xạ.
', 100, 100, 1, 0, 1, N'~/Assets/client/images/product/xuong-rong-kim-ho-thuy-sinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (39, N'Sen đá nâu', 6, CAST(40000 AS Decimal(18, 0)), N'Cây sen đá nâu hay còn gọi là sen chocolate, ý nghĩa cây sẽ mang lại một tình yêu, tình bạn sẽ mãi bền vững và không bao giờ phai nhòa theo thời gian. Cây phù hợp để bàn học, bàn làm việc, cửa sổ, gốc nhỏ riêng…Cây còn có thể để trang trí bàn cưới thay cho hoa, bàn cà phê…', 100, 150, 1, 0, 1, N'~/Assets/client/images/product/sen-da-nau.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (40, N'Sen đá nhím đen', 6, CAST(50000 AS Decimal(18, 0)), N'Cây Sen Đá Nhím Đen phù hợp để trang trí bàn uống cà phê, bàn học, các ô nhỏ trên kệ hoặc các góc nhỏ.', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/sen-da-nhim-den.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (41, N'Sen đá nhung viền đen', 6, CAST(50000 AS Decimal(18, 0)), N'Sen đá nhung viền đen có lớp lông dày và khá mềm, trên mỗi lá có viền đen. Cây mang ý nghĩa mong muốn gia chủ sở hữu được sống trong nhung gấm và lụa là. Cây phù hợp để bàn làm việc, bàn học, trang trí quán cà phê…', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/sen-da-nhung-vien-den.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (42, N'Sen đá nhung viền đỏ đen', 6, CAST(40000 AS Decimal(18, 0)), N'Sen đá nhung viền đỏ có lớp lông nhỏ và nhiều trên lá, sờ lá rất mượt và mền như nhung. Cây mang ý nghĩa một cuộc sống đầy đủ trong nhung gấm lụa là. Cây phù hợp để bàn làm việc, bàn học, trang trí quán cà phê, bàn tiếp khách, lễ tân…', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/sen-da-nhung-vien-do-den.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (43, N'Sen đá phật bà', 6, CAST(40000 AS Decimal(18, 0)), N'Cây Sen đá phật bà là một trong những loại sen đá có nhiều lá nhất, như phật bà quan âm nghìn mắt nhìn tay. Cây sen phật bà không chỉ mang ý nghĩa về một tình yêu và tình bạn bền chặt mà nó còn mang đến sự may mắn như quan âm phù hộ bên người sở hữu. Sen phật bà phù hợp trang trí bàn cưới, cà phê, bàn làm việc, góc học tập, bàn tiếp khách ở các khách sạn, góc riêng….', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/sen-da-phat-ba.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (44, N'Sen đá thạch ngọc', 6, CAST(40000 AS Decimal(18, 0)), N'Cây cảnh sen đá thạch ngọc được lựa chọn để trang trí những nơi sang trọng và gắn liều nhiều với tiền bạc. Cây có lá căng mọng, lá được phủ một lớn phấn nhẹ, đầu lá có thể có viền tím, đỏ, hoặc xanh. Sen đá thạch ngọc mang ý nghĩa đầy đủ, và nhiều tiền bạc mang đến cho chủ sở hữu.', 100, 100, 1, 0, 1, N'~/Assets/client/images/product/sen-da-thach-ngoc.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (45, N'Sen đá Thái', 6, CAST(40000 AS Decimal(18, 0)), N'Sen đá thái là một trong những cây có rất nhiều lá lá xếp chồng nên nhau, dưới góc lại thường hay mọc các cây con nhỏ nhìn rất thích mắt. Cây mang biểu tượng cho một tình yêu, tình bạn luôn bền vững mãi theo thời gian. Cây phù hợp để bàn làm việc, bàn học, trang trí khách sạn, quán cà phê…', 100, 151, 1, 0, 1, N'~/Assets/client/images/product/sen-da-thai.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (46, N'Sen đá thược dược', 6, CAST(40000 AS Decimal(18, 0)), N'Cây sen đá thược dược ngoài ý nghĩa một tình yêu, tình bạn bền vững mãi với thời gian thì nó còn có ý nghĩa tình yêu của người là hạnh phúc của tôi. Cây dùng để trang trí tiểu cảnh, để bàn làm việc, bàn uống nước, bàn lễ tân, quán cà phê…', 100, 200, 2, 0, 1, N'~/Assets/client/images/product/sen-da-thuoc-duoc.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (47, N'Xương rồng bánh sinh nhật', 7, CAST(40000 AS Decimal(18, 0)), N'Xương rồng bánh sinh nhật phù hợp để trang trí quán cà phê, bàn làm việc. Cây có khả năng hút bức xạ máy tính, đuổi tà…Xương rồng bánh sinh nhật chịu được khô hạn và nắng nóng dễ chăm sóc.', 97, 200, 1, 0, 1, N'~/Assets/client/images/product/xuong-rong-banh-sinh-nhat.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (48, N'Xương rồng kim hổ', 7, CAST(50000 AS Decimal(18, 0)), N'Cây xương rồng kim hổ phù hợp để bàn máy tính, bàn làm việc, trang trí quán cà phê…', 95, 200, 1, 0, 1, N'~/Assets/client/images/product/xuong-rong-kim-ho.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (49, N'Xương rồng kim hổ thủy sinh', 7, CAST(110000 AS Decimal(18, 0)), N'Xương rồng kim hổ thủy sinh có ý nghĩa phong thủy giúp trừ tà, phù hợp làm quà tặng, trang trí bàn làm việc, bàn học, để cạnh máy tính giúp hút bức xạ.', 96, 151, 1, 0, 1, N'~/Assets/client/images/product/xuong-rong-kim-ho-thuy-sinh.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (50, N'Xương rồng tai thỏ', 7, CAST(40000 AS Decimal(18, 0)), N'Xương rồng tai thỏ có tác dụng hút bức xạ máy tính, nên cây phù hợp để bàn máy tính, bàn làm việc…', 96, 207, 1, 0, 1, N'~/Assets/client/images/product/xuong-rong-tai-tho.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (51, N'Xương rồng thần long', 7, CAST(80000 AS Decimal(18, 0)), N'Xương rồng Thần Long là một trong loại xương rồng có hoa rất đẹp, hoa to và có nhiều màu sắc khác nhau từ màu trắng, cam, đỏ, hồng…Cây trên 2 năm mới cho ra hoa. Có khả năng hút bức xạ máy tính. Cây mang ý nghĩa cho sự bảo vệ, phù hợp để bàn làm việc, bàn học, quán cà phê…', 98, 200, 2, 0, 1, N'~/Assets/client/images/product/xuong-rong-than-long.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (52, N'Xương rồng Thanh Sơn', 7, CAST(50000 AS Decimal(18, 0)), N'Xương rồng Thanh Sơn được nhiều bạn trẻ ưa thích, mua về trang trí bàn học, bàn làm việc, tặng nhau trong các dịp lễ như mong muốn dù có khó khăn thế nào cũng vẫn có thể vượt qua', 100, 100, 3, 0, 1, N'~/Assets/client/images/product/xuong-rong-thanh-son.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (53, N'Xương rồng trứng chim', 7, CAST(40000 AS Decimal(18, 0)), N'Xương rồng trứng chim mang biểu tượng cho sự kiên cường, cây giúp hút bức xạ máy tính. Phù hợp để bàn làm việc, bàn học, trang trí…', 98, 50, 1, 0, 1, N'~/Assets/client/images/product/xuong-rong-trung-chim.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (54, N'Tiểu cảnh cặp đôi hoàn hảo', 8, CAST(130000 AS Decimal(18, 0)), N'Chậu sen đá cặp đôi hoàn hảo gồm 2 sản phẩm, quý khách có thể tự lựa chọn cây và chậu, bên cây cảnh sẽ trang trí một cách hợp lý và đẹp nhất cho quý khách. Cây phù hợp để bàn làm việc, bàn học, của sổ, trang trí quán cà phê…', 100, 100, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-cap-doi-hoan-hao.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (55, N'Tiểu cảnh bàn cờ tiên', 8, CAST(250000 AS Decimal(18, 0)), N'Tiểu cảnh của bàn cờ tiên bao gồm các loại sen đá và mỗi loại lại có một ý nghĩa khác nhau, nó đen đến cho gia chủ tiền bạc và sự thoải mái. Tiểu cảnh phù hợp để làm quà biếu sếp, để  bàn làm việc của lãnh đão, phòng khách, sản khách sạn….', 100, 150, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-ban-co-tien.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (56, N'Tiểu cảnh bộ 3', 8, CAST(130000 AS Decimal(18, 0)), N'Tiểu cảnh bộ 3 phù hợp để bàn làm việc, quà tặng, trang trí quầy bán hàng, lễ tân…', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-bo-3.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (57, N'Tiểu cảnh một vợ hai con', 8, CAST(130000 AS Decimal(18, 0)), N'Sản phẩm phù hợp để bàn ở phòng khách, bàn trang điểm, trang trí khách sạn, quán cà phê, bàn làm việc…Ý nghĩa luôn được vui vẻ và tươi cười', 100, 300, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-mot-vo-hai-con.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (58, N'Tiểu cảnh ngôi nhà nhỏ trên thảo nguyên', 8, CAST(250000 AS Decimal(18, 0)), N'Tiểu cảnh sen đá ngôi nhà nhỏ trên thảo nguyên sẽ giúp bạn thư thái và thoải mái, trong những lúc làm việc căng thẳng. Chậu bao gồm đô lá trắng, sen tứ phương, chuỗi ngọc đứng, bông hồng trắng, đều là những loại sen đá có ý nghĩa phong thủy rất tốt. Cây phù hợp để bàn tiếp khách, sảng khách sạn, bàn lễ tân, bàn sếp…', 100, 400, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-ngoi-nha-nho-tren-thao-nguyen.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (59, N'Tiểu cảnh sen đá bát nhỏ', 8, CAST(180000 AS Decimal(18, 0)), N'Tiểu cảnh bát nhỏ phù hợp để bàn uống nước, bàn làm việc của sếp, trang trí quán cà phê, bàn lễ tân…', 100, 200, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-sen-da-bat-nho.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (60, N'Tiểu cảnh điền viên', 8, CAST(400000 AS Decimal(18, 0)), N'Tiểu cảnh sen đá điền viên mang ý nghĩa một cuộc sống yên bình, thư thái và nhàn nhã. Tiểu cảnh phù hợp để trong bàn làm việc của sếp, quà biếu, phòng khách, sản khách sạn, quán cà phê…', 100, 250, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-dien-vien.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (61, N'Tiểu cảnh sen đá đình làng', 8, CAST(500000 AS Decimal(18, 0)), N'Tiểu cảnh sen đá đình làng mang đến cho bạn sự thoái mái và thư thái. Tiểu cảnh có ý nghĩa một cuộc sống an nhàn và thoải mái. Phù hợp làm quà tặng sếp, sinh nhật, để bàn lễ tân, khách sạn, trang trí quán cà phê, nhà hàng…', 100, 280, 1, 0, 1, N'~/Assets/client/images/product/tieu-canh-sen-da-dinh-lang.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (62, N'Terrarium 10 cây sen đá', 9, CAST(550000 AS Decimal(18, 0)), N'Terrarium gồm 10 cây sen đá các loại được trồng vào trong bình thủy tinh với ý nghĩa công việc, tình cảm, tiền bạc đều được như mong muốn, toàn vẹn và như ý. Terrarium phù hợp để bàn làm việc, trang trí quán cà phê, khách sạn…', 100, 500, 1, 0, 1, N'~/Assets/client/images/product/terrarium-10-cay-sen-da.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (63, N'Terrarium bách niên giai lão', 9, CAST(160000 AS Decimal(18, 0)), N'Terrarium bách niên giai lão mang ý nghĩa cùng nhau sống đến trăm tuổi, trăm năm hạnh phúc. Bình rất phù hợp để trang trí bàn làm việc, quán cà phê, bàn học, sảng khách sạn…', 100, 288, 1, 0, 1, N'~/Assets/client/images/product/terrarium-bach-nien-giai-lao.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (64, N'Terrarium ngôi nhà nhỏ trên thảo nguyên', 9, CAST(280000 AS Decimal(18, 0)), N'Terrarium ngôi nhà nhỏ trên thảo nguyên khắc họa lại hình ảnh thảo nguyên thu nhỏ. Bình phù hợp để trang trí quán cà phê, phòng khách, bàn làm việc, lễ tân…', 100, 288, 1, 0, 1, N'~/Assets/client/images/product/terrarium-ngoi-nha-nho-tren-thao-nguyen.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (65, N'Xương rồng Bát tiên', 7, CAST(25000 AS Decimal(18, 0)), N'Xương rồng bát tiên có tên khoa học là Euphorbia milii là một loại xương rồng được du nhập từ  vùng Madagascar. Cây có thể nở quanh năm nếu có đủ ánh sáng. Xương rồng bát tiên cũng là một trong những cây cảnh đẹp. Nó có những chiếc lá hình thìa mọc ra từ thân cây tại đầu của những chiếc gai, còn hoa là vô số những chiếc lá nhỏ khác xếp vòng tròn vào nhau. Đặc biệt, bạn có thể không nhận thấy những bông hoa vì chúng quá nhỏ, bạn chỉ có thể thấy màu đỏ, màu cá hồi, hoặc màu vàng mọc ra từ thân của chúng.', 198, 153, 1, 0, 1, N'~/Assets/client/images/product/xuong-rong-bat-tien.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (66, N'Dây tưới nhỏ giọt', 10, CAST(10000 AS Decimal(18, 0)), N'Dây tưới nước nhỏ giọt do Dig Corp. sản xuất cung cấp một công cụ tưới hiện đại, thuận lợi, tối ưu chi phí đầu tư. Với kích cỡ nhỏ, Dig Dripline hoàn toàn phù hợp với các loại cây cảnh quan trong nhà và sân vườn. Khách hàng có thể dùng Dig dripline để lắp đặt cho các cây trong chậu, vườn rau nhỏ, cây trồng ở ban công, hoặc có thể dùng quấn quanh gốc cho các cây có bộ rễ lớn như cây ăn quả....  ', 100, 1, 1, 0, 1, N'~/Assets/client/images/product/day-tuoi-nho-giot.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (67, N'Bộ tượng trang trí Phúc-Lộc-Thọ', 10, CAST(25000 AS Decimal(18, 0)), N'Sản phẩm Bộ tượng Phúc lộc thọ thần tài may mắn trang trí xe ô tô gồm: 5 tượng trang trí,
Kích thước ~ 3.8×4.5 Cm,
Có các màu khác nhau,
Chất liệu Tổng hợp,
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh, trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng, trang trí hồ cá…
Nếu quý khách có yêu cầu khác về màu sắc và kiểu dáng thì vui lòng chat hoặc liên hệ trực tiếp. Nếu không Shop sẽ giao hàng ngẫu nhiên.
Khách hàng có thể nhắn tin cho Shop hoặc gọi điện số 0934 087 969 để trao đổi thêm về sản phẩm.', 100, 1, 1, 10, 1, N'~/Assets/client/images/product/bo-tuong-trang-tri-phuc-loc-tho.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (68, N'Bộ tượng Phật', 10, CAST(30000 AS Decimal(18, 0)), N'Bộ tượng phật trang trí xe hơi, để bàn, trang trí bàn làm việc, góc học tập
Trang trí tiểu cảnh sân vườn, cây cảnh
Bộ tượng gồm 9 tượng 
Kích thước cao 4cm', 100, 1, 1, 0, 1, N'~/Assets/client/images/product/bo-tuong-phat.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (69, N'Tượng nhà sư vui vẻ', 10, CAST(35000 AS Decimal(18, 0)), N'Sản phẩm gồm 01 Tượng nhà sư vui vẻ
Kích thước 2.6x3cm
Chất liệu bột đá đúc khuôn
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh, trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng, trang trí hồ cá…', 15000, 1, 1, 0, 1, N'~/Assets/client/images/product/tuong-nha-su-vui-ve.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (70, N'Cầu vòm đá', 10, CAST(10000 AS Decimal(18, 0)), N'Kích thước 2x5cm
Chất liệu bột đá đúc khuôn
Chất liệu bột đá đúc khuôn
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh, trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng, trang trí hồ cá…', 90, 1, 1, 0, 1, N'~/Assets/client/images/product/cau-vom-da.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (71, N'Biệt thự châu Âu', 10, CAST(25000 AS Decimal(18, 0)), N'Sản phẩm gồm 1 mô hình Biệt Thự Châu Âu
Kích thước Gồm có các loại:  4x6x7 Cm. 5x6Cm và 5x9x9Cm
Chất liệu bột đá đúc khuôn
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh, trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng, trang trí hồ cá…', 120, 1, 1, 0, 1, N'~/Assets/client/images/product/biet-thu-chau-au.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (72, N'Bình tưới cây', 10, CAST(15000 AS Decimal(18, 0)), N'Bình xịt nước, xịt dung dịch
Bình xịt tưới cây dung tích 500ml
Kích thước: 25x10cm
Chất liệu nhựa cao cấp
Xuất sứ: Việt Nam', 160, 2, 1, 0, 1, N'~/Assets/client/images/product/binh-tuoi-cay.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (73, N'Cối xay nước', 10, CAST(10000 AS Decimal(18, 0)), N'Sản phẩm gồm 1 Cối Xay Nước như hình.
Kích thước 4x4cm
Chất liệu bột đá đúc khuôn
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh, trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng, trang trí hồ cá…
Nếu quý khách có yêu cầu khác về màu sắc và kiểu dáng thì vui lòng chat hoặc liên hệ trực tiếp. Nếu không Shop sẽ giao hàng ngẫu nhiên.
Khách hàng có thể nhắn tin cho Shop hoặc gọi điện số 0934 087 969 để trao đổi thêm về sản phẩm.', 200, 1, 1, 0, 1, N'~/Assets/client/images/product/coi-xay-nuoc.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (74, N'Hòn non bộ', 10, CAST(12000 AS Decimal(18, 0)), N'Sản phẩm gồm 1 hòn non bộ 
Kích thước 3.5x5cm
Chất liệu bột đá đúc khuôn
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh, trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng, trang trí hồ cá…', 1000, 1, 1, 0, 1, N'~/Assets/client/images/product/hon-non-bo.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (75, N'Gói chân cắm phụ kiện', 10, CAST(30000 AS Decimal(18, 0)), N'Gồm 1 Gói Chân Cắm Phụ Kiện ~ 100 chiếc như hình.
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh trồng cây, terrarium…
Để giúp các bạn dễ hình dung kích thước sản phẩm, Shop đã cố gắng chụp hình sản phẩm theo kích thước bàn tay.
Ảnh sản phẩm được shop chụp thật 100 %
Nếu quý khách có yêu cầu khác về màu sắc và kiểu dáng thì vui lòng chat hoặc liên hệ trực tiếp. Nếu không Shop sẽ giao hàng ngẫu nhiên.', 50, 1, 1, 0, 1, N'~/Assets/client/images/product/goi-chan-cam-phu-kien.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (76, N'San hô', 10, CAST(15000 AS Decimal(18, 0)), N'Sản phẩm gồm 1 cây san hô
Kích thước nhiều loại
Chất liệu bột đá đúc khuôn
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh, trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng, trang trí hồ cá…', 100, 1, 1, 0, 1, N'~/Assets/client/images/product/san-ho.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (77, N'Búp bê Noel', 10, CAST(5000 AS Decimal(18, 0)), N'Gồm 1 sản phẩm Trang Trí Noel như hình.
Có nhiều tượng, và các phụ kiện trang trí khác nhau như hình.
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng…
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng…
 Để giúp các bạn dễ hình dung kích thước sản phẩm, Shop đã cố gắng chụp hình sản phẩm theo kích thước bàn tay.
Ảnh sản phẩm được shop chụp thật 100%', 135, 1, 1, 0, 1, N'~/Assets/client/images/product/bup-be-noel.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (78, N'Ô bảy màu', 10, CAST(12000 AS Decimal(18, 0)), N'Gồm 1 chiếc Ô Sắc Màu như hình.
Có 7 loại kích thước và màu sắc khác nhau.
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng…', 140, 2, 1, 0, 1, N'~/Assets/client/images/product/o-bay-mau.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (79, N'Bóng bay', 10, CAST(10000 AS Decimal(18, 0)), N'Bóng Bay Sắc Màu gồm 1 chùm 8 quả bóng bay, đủ màu sắc
Có 2 loại tròn và hình trái tim.
Sản phẩm thường được sử dụng trong trang trí tiểu cảnh trồng cây, terrarium, đồ trang trí, lưu niệm, quà tặng…', 120, 1, 1, 0, 1, N'~/Assets/client/images/product/bong-bay.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (80, N'Cầu vồng', 10, CAST(10000 AS Decimal(18, 0)), N'Cầu Vồng gồm 1 cầu vồng tùy chọn. Có 7 loại cầu vòng sắc màu.Cầu Vồng. Sản phẩm thường được sử dụng trong trang trí tiểu cảnh trồng cây, terrarium', 200, 1, 1, 0, 1, N'~/Assets/client/images/product/cau-vong.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (81, N'Terrarium sân vườn', 9, CAST(450000 AS Decimal(18, 0)), N'Giới thiệu: Tiểu cảnh Terrarium Sen Đá trong chậu nhựa phù hợp làm quà tặng để bàn làm việc, trang trí văn phòng, nội thất. Sức sống bền bỉ, mạnh mẽ, dễ chăm sóc.
Ý nghĩa: Sen đá tượng trưng cho sự may mắn, tình yêu chung thuỷ, bền lâu. Xương rồng tượng trưng cho sự mạnh mẽ, bền bỉ.
Cách chăm sóc: Tưới ít nước, để chỗ thoáng mát có nhiều ánh sáng, 1 tuần tưới một lần. Mỗi lần 20-50ml nước (sử dụng bình tưới chuyên dụng)
Đường kính chậu:
– 20x24cm
Bao gồm các loại cây:
– Sen đá: Đá đỏ, Đá xanh, Đá cam, Viền Đỏ, Hồng Phấn, Chuỗi Ngọc Đứng, Hoa Cúc, Đôla trắng, Thái, Sedum Tuyết, Sedum Vàng, Sedum đồng tiền…', 10, 1, 1, 0, 1, N'~/Assets/client/images/product/terrarium-san-vuon.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (82, N'Terrarium ngôi nhà bình yên', 9, CAST(500000 AS Decimal(18, 0)), N'Giới thiệu: Tiểu cảnh Terrarium cẩm nhung kết hợp các dòng cây nội thất: Cau tiểu châm, Tùng la hán… phù hợp để bàn làm việc, trang trí văn phòng, nội thất. Sức sống bền bỉ, mạnh mẽ, dễ chăm sóc.
Ý nghĩa: Cẩm nhung tượng trưng cho sự may mắn, bền lâu, gắn kết. Tùng và Cau tiểu châm tượng trưng cho sự sung túc, viên mãn
Cách chăm sóc: Tưới nước hàng ngày. Mỗi lần 20-50ml nước (sử dụng bình tưới chuyên dụng)
Đường kính chậu:
– Cao 20cm, rộng 15cm
Bao gồm các loại cây:
– Cây Cẩm nhung: hay còn gọi là lá may mắn (fittonia)
– Cau tiểu châm
– Cỏ trồng tiểu cảnh
– Tùng la hán
– Vàng anh lá chanh', 15, 1, 1, 0, 1, N'~/Assets/client/images/product/terrarium-ngoi-nha-binh-yen.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (83, N'Terrarium ngôi nhà mơ ước', 9, CAST(550000 AS Decimal(18, 0)), N'Giới thiệu: Tiểu cảnh Terrarium Sen Đá kết hợp với cây Cần Thăng trong chậu Composite phù hợp làm quà tặng để bàn làm việc, trang trí văn phòng, nội thất. Sức sống bền bỉ, mạnh mẽ, dễ chăm sóc.
Ý nghĩa: Sen đá tượng trưng cho sự may mắn, tình yêu chung thuỷ, bền lâu. Cần Thăng được viết tắt từ hai từ “CẦN CÙ” và “THẮNG TIẾN”, bản thân cây luôn thể hiện nỗ lực không ngừng vươn tới vượt qua mọi khó khăn trở ngại để thành công trong cuộc sống.
Cách chăm sóc: Tưới ít nước, để chỗ thoáng mát có nhiều ánh sáng, 1 tuần tưới một lần. Mỗi lần 20-50ml nước (sử dụng bình tưới chuyên dụng)
Đường kính chậu:
– Cao 30cm, rộng 25cm
Bao gồm các loại cây:
– Sen đá: Đá đỏ, Hồng phấn, Tứ phương, Thái, Sedum đồng tiền, Hồng điệu, Đôla trắng, Cánh bướm, Sedum giống mới…
– Cây Cần Thăng', 20, 1, 1, 0, 1, N'~/Assets/client/images/product/terrarium-ngoi-nha-mo-uoc.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (84, N'Terrarium cẩm nhung', 9, CAST(700000 AS Decimal(18, 0)), N'Giới thiệu: Tiểu cảnh Terrarium cẩm nhung (fittonia) kết hợp các dòng cây nội thất phù hợp để bàn làm việc, trang trí văn phòng, nội thất. Sức sống bền bỉ, mạnh mẽ, dễ chăm sóc.
Ý nghĩa: Cẩm nhung tượng trưng cho sự may mắn, bền lâu, gắn kết.
Cách chăm sóc: Tưới nước hàng ngày. Mỗi lần 20-50ml nước (sử dụng bình tưới chuyên dụng)
Đường kính chậu:
– Cao 20cm, rộng 15cm
Bao gồm các loại cây:
– Cây Cẩm nhung: hay còn gọi là lá may mắn (fittonia)
– Cây Cần Thăng
– Cây Rêu Tiên
– Cây Cau Tiểu Trâm', 6, 1, 1, 0, 1, N'~/Assets/client/images/product/terrarium-cam-nhung.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (85, N'Terrarium tùng bồng lai', 9, CAST(350000 AS Decimal(18, 0)), N'Giới thiệu: Tiểu cảnh Terrarium Tùng bồng lai kết hợp với các phụ kiện trang trí Terrarium phù hợp để bàn làm việc, trang trí văn phòng, nội thất. Sức sống bền bỉ, mạnh mẽ, dễ chăm sóc.
Ý nghĩa: Cây Tùng bồng lai là một loài cây có sức sống rất mãnh liệt và bền bỉ để thích nghi tốt với mọi khí hậu, thời tiết. Theo quan niệm của dân gian, tùng bồng lai chính là biểu trưng cho sức sống bền bỉ, dám đương đầu với mọi khó khăn của hoàn cảnh để vươn lên trong cuộc sống.
Cách chăm sóc: Tưới nước 3-4 ngày/lần. Mỗi lần 20-50ml nước (sử dụng bình tưới chuyên dụng)
Đường kính chậu:
– 14cm
Bao gồm các loại cây:
– Cây Tùng bồng lai
– Phụ kiện trang trí Terrarium', 1, 2, 1, 0, 1, N'~/Assets/client/images/product/terrarium-tung-bong-lai.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (86, N'Terrarium đầu bạc răng long', 9, CAST(140000 AS Decimal(18, 0)), N'Giới thiệu: Tiểu cảnh Terrarium cẩm nhung (fittonia) kết hợp các dòng cây nội thất phù hợp để bàn làm việc, trang trí văn phòng, nội thất. Sức sống bền bỉ, mạnh mẽ, dễ chăm sóc.
Ý nghĩa: Cẩm nhung tượng trưng cho sự may mắn, bền lâu, gắn kết.
Cách chăm sóc: Tưới nước hàng ngày. Mỗi lần 20-50ml nước (sử dụng bình tưới chuyên dụng)
Đường kính chậu:
– 22cm
Bao gồm các loại cây:
– Cây Cẩm nhung
– Cây Rêu tiên
– Cây Mộc hương
– Phụ kiện trang trí Terrarium', 16, 1, 1, 0, 1, N'~/Assets/client/images/product/terrarium-dau-bac-rang-long.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (87, N'Terrarium trong cốc', 9, CAST(200000 AS Decimal(18, 0)), N'Giới thiệu: Tiểu cảnh Terrarium Sen Đá trong chậu gốm sứ xuất khẩu hình tách trà phù hợp làm quà tặng để bàn làm việc, trang trí văn phòng, nội thất. Sức sống bền bỉ, mạnh mẽ, dễ chăm sóc.
Ý nghĩa: Sen đá tượng trưng cho sự may mắn, tình yêu chung thuỷ, bền lâu. Xương rồng tượng trưng cho sự mạnh mẽ, bền bỉ.
Cách chăm sóc: Tưới ít nước, để chỗ thoáng mát có nhiều ánh sáng, 1 tuần tưới một lần. Mỗi lần 20-50ml nước (sử dụng bình tưới chuyên dụng)
Bao gồm các loại cây:
– Sen đá: Hoa cúc, Nhật nguyệt, Sỏi, Sedum vàng, Đá xanh…
– Phụ kiện trang trí Terrarium', 15, 1, 1, 0, 1, N'~/Assets/client/images/product/terrarium-trong-coc.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [Price], [Description], [StockQuantity], [Views], [Priority], [Discount], [Status], [Avatar]) VALUES (88, N'Dụng cụ làm vườn', 10, CAST(20000 AS Decimal(18, 0)), N'Dùng để trồng cây cảnh, làm vườn…
Để giúp các bạn dễ hình dung kích thước sản phẩm, Shop đã cố gắng chụp hình sản phẩm theo kích thước bàn tay.
Nếu quý khách có yêu cầu khác về màu sắc và kiểu dáng thì vui lòng chat hoặc liên hệ trực tiếp. Nếu không Shop sẽ giao hàng ngẫu nhiên.', 100, 10, 1, 10, 1, N'~/Assets/client/images/product/dung-cu-lam-vuon.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Properties] ON 

INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (1, 1, 1, 1, 10, 100, 15, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (2, 2, 1, 1, 8, 80, 10, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (3, 3, 1, 1, 7, 75, 12, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (4, 4, 1, 1, 12, 85, 10, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (5, 5, 1, 1, 6, 140, 10, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (6, 6, 1, 1, 7, 50, 13, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (7, 7, 1, 1, 9, 70, 14, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (8, 8, 1, 1, 8, 80, 12, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (9, 9, 1, 0, 3, 50, 4, 28)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (10, 10, 1, 1, 10, 100, 15, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (11, 11, 1, 0, 5, 40, 10, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (12, 12, 1, 0, 4, 20, 12, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (13, 13, 1, 0, 4, 30, 10, 28)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (14, 14, 1, 0, 4, 25, 15, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (15, 15, 1, 0, 5, 35, 10, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (16, 16, 1, 0, 5, 45, 10, 28)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (17, 17, 0, 1, 1, 20, 2, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (18, 18, 0, 0, 2, 10, 3, 26)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (19, 19, 0, 1, 3, 15, 5, 28)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (20, 20, 0, 0, 4, 18, 10, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (21, 21, 0, 1, 5, 12, 10, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (22, 22, 0, 0, 6, 20, 12, 24)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (23, 23, 0, 1, 3, 15, 8, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (24, 24, 0, 0, 2, 10, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (25, 25, 1, 0, 4, 10, 3, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (26, 26, 0, 0, 4, 15, 2, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (27, 27, 1, 0, 4, 10, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (28, 28, 1, 0, 4, 12, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (29, 29, 0, 0, 4, 18, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (30, 30, 1, 0, 4, 20, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (31, 31, 1, 0, 4, 15, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (32, 32, 0, 0, 4, 15, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (33, 33, 1, 1, 10, 20, 2, 28)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (34, 34, 1, 0, 6, 60, 5, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (35, 35, 1, 1, 12, 40, 6, 26)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (36, 36, 1, 0, 5, 30, 4, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (37, 37, 1, 1, 10, 30, 3, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (38, 38, 1, 0, 5, 30, 3, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (39, 39, 1, 1, 10, 20, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (40, 40, 0, 0, 5, 10, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (41, 41, 1, 1, 10, 20, 5, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (42, 42, 0, 0, 5, 10, 4, 28)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (43, 43, 1, 1, 10, 20, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (44, 44, 0, 0, 5, 10, 4, 24)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (45, 45, 1, 1, 10, 20, 5, 20)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (46, 46, 0, 0, 5, 10, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (47, 47, 0, 1, 10, 5, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (48, 48, 0, 1, 10, 5, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (49, 49, 0, 1, 12, 5, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (50, 50, 0, 1, 10, 5, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (51, 51, 0, 1, 10, 5, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (52, 52, 0, 1, 12, 5, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (53, 53, 0, 1, 10, 5, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (54, 54, 1, 1, 8, 10, 4, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (55, 55, 0, 0, 5, 5, 8, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (56, 56, 1, 0, 5, 10, 5, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (57, 57, 0, 1, 8, 4, 6, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (58, 58, 1, 0, 5, 15, 10, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (59, 59, 0, 0, 5, 4, 9, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (60, 60, 1, 1, 8, 10, 15, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (61, 61, 0, 0, 5, 6, 8, 27)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (62, 62, 1, 0, 5, 10, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (63, 63, 1, 0, 6, 10, 8, 24)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (64, 64, 1, 0, 7, 10, 8, 20)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (65, 65, 0, 1, 10, 4, 4, 30)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (66, 81, 1, 1, 10, 10, 4, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (67, 82, 1, 1, 12, 12, 5, 25)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (68, 83, 1, 1, 10, 10, 8, 24)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (69, 84, 1, 1, 12, 15, 6, 22)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (70, 85, 1, 1, 10, 10, 7, 23)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (71, 86, 1, 1, 12, 15, 6, 26)
INSERT [dbo].[Properties] ([Id], [ProductId], [IsLikeWater], [IsLikeSunny], [RecommendSunnyHour], [RecommendWater], [RecommendFertilizer], [RecommendTemperature]) VALUES (72, 87, 1, 1, 10, 12, 8, 28)
SET IDENTITY_INSERT [dbo].[Properties] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNQ_UserName]    Script Date: 12/16/2019 7:30:11 PM ******/
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [UNQ_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blogs] ADD  CONSTRAINT [DF_Blogs_View]  DEFAULT ((100)) FOR [View]
GO
ALTER TABLE [dbo].[Blogs] ADD  CONSTRAINT [DF_Blogs_DatePost]  DEFAULT (getdate()) FOR [DatePost]
GO
ALTER TABLE [dbo].[Blogs] ADD  CONSTRAINT [DF_Blogs_Hot]  DEFAULT ((1)) FOR [Priority]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_TotalMoney]  DEFAULT ((0)) FOR [TotalMoney]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Tax]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Tax]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_StockQuantity]  DEFAULT ((0)) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_View]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Priority]  DEFAULT ((1)) FOR [Priority]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Levels] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Levels] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Levels]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([ProcessingEmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees1] FOREIGN KEY([ShipperEmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentMethods] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethods] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentMethods]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Deliveries] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_Products]
GO
