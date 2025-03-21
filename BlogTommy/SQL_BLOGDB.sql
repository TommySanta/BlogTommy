
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[content] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategories](
	[post_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostImages]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[IsMainImage] [bit] NOT NULL,
	[Position] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[status_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[image_url] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostStatus]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[post_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/03/2025 14:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password_hash] [nvarchar](255) NOT NULL,
	[role_id] [int] NOT NULL,
	[banned] [bit] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (1, N'Tecnología', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (2, N'Salud y Bienestar', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (3, N'Educación', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (4, N'Entretenimiento', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (5, N'Deportes', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (6, N'Viajes', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (7, N'Gastronomía', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (8, N'Estilo de Vida', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (9, N'Noticias', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
INSERT [dbo].[Categories] ([id], [name], [created_at]) VALUES (10, N'Arte y Cultura', CAST(N'2025-02-21T10:17:57.687' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (1, 39, 2, N'Ejemplo para ver comentario', CAST(N'2025-03-13T12:20:50.223' AS DateTime))
INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (2, 39, 2, N'Funcionaaa!!!!', CAST(N'2025-03-13T12:23:27.370' AS DateTime))
INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (3, 39, 2, N'Ejemplo', CAST(N'2025-03-13T12:33:20.783' AS DateTime))
INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (4, 39, 2, N'Hola', CAST(N'2025-03-13T12:39:44.957' AS DateTime))
INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (5, 32, 2, N'Comenta amanda', CAST(N'2025-03-13T12:41:15.523' AS DateTime))
INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (6, 39, 2, N'Charla 5', CAST(N'2025-03-13T12:54:14.027' AS DateTime))
INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (7, 34, 2, N'Ejemplo', CAST(N'2025-03-13T13:02:50.843' AS DateTime))
INSERT [dbo].[Comments] ([id], [post_id], [user_id], [content], [created_at]) VALUES (8, 34, 2, N'Ejemplo dos', CAST(N'2025-03-13T13:06:20.473' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (11, 6)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (12, 6)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (13, 7)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (14, 7)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (15, 8)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (16, 8)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (17, 9)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (18, 9)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (19, 10)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (20, 10)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (31, 10)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (32, 1)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (33, 6)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (34, 3)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (35, 3)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (36, 3)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (37, 3)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (38, 3)
INSERT [dbo].[PostCategories] ([post_id], [category_id]) VALUES (39, 3)
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (11, 2, N'El Futuro de la Inteligencia Artificial', N'Este post explora cómo la IA está revolucionando diferentes industrias...', 1, CAST(N'2025-02-26T10:24:00.270' AS DateTime), CAST(N'2025-02-26T10:24:00.270' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (12, 2, N'5 Tecnologías Emergentes en 2025', N'Un análisis detallado sobre las tecnologías que dominarán el futuro...', 1, CAST(N'2025-02-26T10:24:00.270' AS DateTime), CAST(N'2025-02-26T10:24:00.270' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (13, 2, N'La Importancia de una Buena Alimentación', N'En este post te damos consejos para llevar una alimentación balanceada...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (14, 2, N'Cómo Mejorar tu Salud Mental', N'Técnicas y estrategias para mantener una mente sana en tiempos difíciles...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (15, 2, N'Educación en la Era Digital', N'La tecnología está cambiando la forma en que enseñamos y aprendemos...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (16, 2, N'Métodos de Estudio Eficientes', N'Aquí te presentamos algunos métodos de estudio que realmente funcionan...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (17, 2, N'Las Mejores Películas de 2024', N'Este post recopila las películas más aclamadas por la crítica y el público...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (18, 2, N'Tendencias en Videojuegos para el 2025', N'Los videojuegos están evolucionando y estas son las tendencias que marcarán el futuro...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (19, 2, N'El Futuro del Fútbol Internacional', N'El fútbol está en constante evolución, con cambios significativos en el juego...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (20, 2, N'Preparación Física para Atletas', N'Consejos para mejorar el rendimiento físico de los atletas de élite...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (21, 2, N'Los Mejores Destinos para Viajar en 2025', N'En este post te mostramos los destinos que no te puedes perder este año...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (22, 2, N'Consejos para Viajar Solo', N'Si estás planeando un viaje solo, estos consejos te ayudarán a tener una experiencia increíble...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (23, 2, N'Recetas Saludables para la Semana', N'Te proponemos recetas fáciles y saludables para toda la semana...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (24, 2, N'Tendencias Gastronómicas 2025', N'La gastronomía está evolucionando, y estas son las tendencias para el próximo año...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (25, 2, N'Cómo Tener una Vida más Organizada', N'La organización es clave para tener una vida más productiva y equilibrada...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (26, 2, N'El Arte de la Meditación', N'La meditación puede ayudarte a reducir el estrés y mejorar tu bienestar...', 1, CAST(N'2025-02-26T10:24:00.273' AS DateTime), CAST(N'2025-02-26T10:24:00.273' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (27, 2, N'La Economía Global en 2025', N'Analizamos las previsiones económicas para este nuevo año...', 1, CAST(N'2025-02-26T10:24:00.277' AS DateTime), CAST(N'2025-02-26T10:24:00.277' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (28, 2, N'Nuevas Leyes que Afectarán tu Vida en 2025', N'Este post te cuenta todo lo que necesitas saber sobre las nuevas leyes...', 1, CAST(N'2025-02-26T10:24:00.277' AS DateTime), CAST(N'2025-02-26T10:24:00.277' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (29, 2, N'Las Mejores Exposiciones de Arte de 2025', N'Este año, el mundo del arte se llena de exposiciones imperdibles...', 1, CAST(N'2025-02-26T10:24:00.277' AS DateTime), CAST(N'2025-02-26T10:24:00.277' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (30, 2, N'La Influencia de la Cultura Pop en el Arte Moderno', N'Exploramos cómo la cultura pop ha moldeado el arte contemporáneo...', 1, CAST(N'2025-02-26T10:24:00.277' AS DateTime), CAST(N'2025-02-26T10:24:00.277' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (31, 2, N'Ejemplo', N'<p>Ejemplo con coche&nbsp;</p>

<p>Esto<strong> es un ejemplo <em><s>con estilos&nbsp;</s></em></strong></p>

<ul>
	<li><strong><em>Prueba&nbsp;aaa<a href="https://cdn.worldvectorlogo.com/logos/victor-2.svg" target="_self"><img alt="Ejemplo" src="https://cdn.worldvectorlogo.com/logos/victor-2.svg" style="border-style:solid; border-width:2px; float:right; height:250px; width:250px" /></a></em></strong></li>
</ul>
', 1, CAST(N'2025-03-10T09:15:16.403' AS DateTime), CAST(N'2025-03-10T09:15:16.403' AS DateTime), N'https://www.usatoday.com/gcdn/presto/2023/06/15/USAT/b031760f-26da-42a6-b626-fd20953a2743-SquarelogoPNG.png?crop=2055,2055,x0,y0')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (32, 2, N'Ejemplo2', N'<p>Prueba de imagen&nbsp;</p>
', 1, CAST(N'2025-03-10T09:39:31.473' AS DateTime), CAST(N'2025-03-10T09:39:31.473' AS DateTime), N'/images/70c98dee-51e7-4e4e-8f11-b6d8333ba568_cochechulo2.jpg')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (33, 2, N'Coche', N'<h2>El mejor coche que he probado para viajes&nbsp;</h2><ul><li><i><strong>Guapo</strong></i></li><li><i><strong>Chulo</strong></i></li></ul><ol><li>Increíble<img src="https://www.autopista.es/uploads/s1/11/24/74/52/estos-son-los-10-coches-que-se-vendieron-mas-caros-en-la-historia-del-automovil.jpeg" alt="Los 10 coches más caros del mundo, de uno en uno"></li></ol>', 1, CAST(N'2025-03-10T11:35:02.850' AS DateTime), CAST(N'2025-03-10T11:35:02.850' AS DateTime), N'/images/2d382b02-92d5-477b-85c8-7270ab77a3e8_cochechulo2.jpg')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (34, 2, N'Borrar', N'<figure class="image image-style-side"><img src="https://media.istockphoto.com/id/610259354/es/foto/mujer-joven-usando-c%C3%A1mara-r%C3%A9flex-digital.jpg?s=612x612&amp;w=0&amp;k=20&amp;c=M8sk5Mem6PVAEOBONakRf351Bot4N6t013Ehda3Zfd8=" alt="908.800+ Sacar Una Foto Fotografías de stock, fotos e imágenes libres de  derechos - iStock | Fotografia, Camara, Reflejo"></figure><p>Esto es una prueba&nbsp;</p>', 1, CAST(N'2025-03-10T11:42:07.207' AS DateTime), CAST(N'2025-03-10T11:42:07.207' AS DateTime), N'/images/8bdb73ae-6067-43ea-ae7d-2a407d3a05e7_Titulo.gif')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (35, 2, N'Borrar2', N'<h1>Ejemplo</h1>

<hr />
<p><img alt="Ejemplo" src="https://media.istockphoto.com/id/610259354/es/foto/mujer-joven-usando-c%C3%A1mara-r%C3%A9flex-digital.jpg?s=612x612&amp;w=0&amp;k=20&amp;c=M8sk5Mem6PVAEOBONakRf351Bot4N6t013Ehda3Zfd8=" style="height:133px; width:200px" />&nbsp; &nbsp; &nbsp; wow</p>

<p>Funcionar&aacute;?</p>
', 1, CAST(N'2025-03-10T11:49:15.040' AS DateTime), CAST(N'2025-03-10T11:49:15.040' AS DateTime), N'/images/ab91403a-113e-4501-bc04-490af627bda8_elcoche.jpg')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (36, 2, N'Ejemplo', N'<table style="border-collapse: collapse; width: 100%; height: 152.734px;" border="1"><colgroup><col style="width: 16.6822%;"><col style="width: 16.6822%;"><col style="width: 16.6822%;"><col style="width: 16.6822%;"><col style="width: 16.6822%;"><col style="width: 16.6822%;"></colgroup>
<tbody>
<tr style="height: 22.3906px;">
<td style="height: 22.3906px;">Ejemplo</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
</tr>
<tr style="height: 22.3906px;">
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
</tr>
<tr style="height: 22.3906px;">
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">a</td>
<td style="height: 22.3906px;">a</td>
</tr>
<tr style="height: 22.3906px;">
<td style="height: 22.3906px;">aaa</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">a</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">a</td>
<td style="height: 22.3906px;">&nbsp;</td>
</tr>
<tr style="height: 22.3906px;">
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
</tr>
<tr style="height: 22.3906px;">
<td style="height: 22.3906px;">a</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">&nbsp;</td>
<td style="height: 22.3906px;">a</td>
</tr>
<tr style="height: 18.3906px;">
<td style="height: 18.3906px;">&nbsp;</td>
<td style="height: 18.3906px;">&nbsp;</td>
<td style="height: 18.3906px;">&nbsp;</td>
<td style="height: 18.3906px;">aa</td>
<td style="height: 18.3906px;">&nbsp;</td>
<td style="height: 18.3906px;">&nbsp;</td>
</tr>
</tbody>
</table>
<p style="text-align: right;"><strong>Esto es una prueba&nbsp;</strong></p>', 1, CAST(N'2025-03-10T13:07:07.597' AS DateTime), CAST(N'2025-03-10T13:07:07.597' AS DateTime), N'/images/5c16197c-e70f-464e-b01c-ec5ef450e4b7_elcoche.jpg')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (37, 2, N'Ejemplo', N'<p>sha <img src="data:image/png;base64,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"></p>', 1, CAST(N'2025-03-10T13:08:42.443' AS DateTime), CAST(N'2025-03-10T13:08:42.443' AS DateTime), N'/images/01c8f4df-af0b-40b6-890a-5f7e9a518ea0_elcoche.jpg')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (38, 2, N'Esto es un ejemplo largo para probar ', N'<details class="mce-accordion" open="open">
<summary>Ejemplo</summary>
<p>&nbsp;</p>
</details>', 1, CAST(N'2025-03-12T10:02:24.643' AS DateTime), CAST(N'2025-03-12T10:02:24.643' AS DateTime), N'/images/ede9bf25-7be5-4485-9baa-5e9fa8cd5f62_escudo-positivo.jpg')
INSERT [dbo].[Posts] ([id], [user_id], [title], [content], [status_id], [created_at], [updated_at], [image_url]) VALUES (39, 2, N'Ejemplo para ver función Amanda', N'<h1>Ejemplo 2</h1>
<p><em>JAjajaa</em></p>
<table style="border-collapse: collapse; width: 100%;" border="1"><colgroup><col style="width: 33.3333%;"><col style="width: 33.3333%;"><col style="width: 33.3333%;"></colgroup>
<tbody>
<tr>
<td>a</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>a</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>a</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>a</td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>', 1, CAST(N'2025-03-13T09:09:33.393' AS DateTime), CAST(N'2025-03-13T13:44:58.867' AS DateTime), N'/images/30218794-2a5a-4723-b7a1-22c7f944fbe4_cochechulo2.jpg')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[PostStatus] ON 

INSERT [dbo].[PostStatus] ([id], [status]) VALUES (1, N'pending')
INSERT [dbo].[PostStatus] ([id], [status]) VALUES (2, N'published')
INSERT [dbo].[PostStatus] ([id], [status]) VALUES (3, N'rejected')
SET IDENTITY_INSERT [dbo].[PostStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([id], [name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [role_id], [banned], [created_at], [updated_at]) VALUES (2, N'admin', N'admin@example.com', N'admin123', 1, 0, CAST(N'2025-02-26T10:20:17.320' AS DateTime), CAST(N'2025-02-26T10:20:17.320' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__72E12F1B08A3E1EE]    Script Date: 13/03/2025 14:11:36 ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PostStat__A858923CDD27A5BB]    Script Date: 13/03/2025 14:11:36 ******/
ALTER TABLE [dbo].[PostStatus] ADD UNIQUE NONCLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__72E12F1B4D97FED6]    Script Date: 13/03/2025 14:11:36 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tags__72E12F1B91EAAE10]    Script Date: 13/03/2025 14:11:36 ******/
ALTER TABLE [dbo].[Tags] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E6164A862200E]    Script Date: 13/03/2025 14:11:36 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC5727E9D3AB1]    Script Date: 13/03/2025 14:11:36 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[PostImages] ADD  DEFAULT ((0)) FOR [IsMainImage]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Tags] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [banned]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PostCategories]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[PostCategories]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[PostImages]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[PostStatus] ([id])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([id])
GO
USE [master]
GO
ALTER DATABASE [BLOGDB] SET  READ_WRITE 
GO
