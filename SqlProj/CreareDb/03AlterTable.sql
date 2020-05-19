--USE [Vanzari]
--GO
/****** Object:  Index [aaaaaVanzatori_PK]    Script Date: 14.05.2020 08:49:18 ******/
ALTER TABLE [dbo].[Agenti] ADD  CONSTRAINT [aaaaaVanzatori_PK] PRIMARY KEY NONCLUSTERED 
(
	[MarcaAgent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaCategoriiProduse_PK]    Script Date: 14.05.2020 08:49:18 ******/
ALTER TABLE [dbo].[CategoriiMarfuri] ADD  CONSTRAINT [aaaaaCategoriiProduse_PK] PRIMARY KEY NONCLUSTERED 
(
	[CodCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaBonuriDeCasa_PK]    Script Date: 14.05.2020 08:49:18 ******/
ALTER TABLE [dbo].[Comenzi] ADD  CONSTRAINT [aaaaaBonuriDeCasa_PK] PRIMARY KEY NONCLUSTERED 
(
	[IdComanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaProduse_PK]    Script Date: 14.05.2020 08:49:18 ******/
ALTER TABLE [dbo].[Marfuri] ADD  CONSTRAINT [aaaaaProduse_PK] PRIMARY KEY NONCLUSTERED 
(
	[IdMarfa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaPlati_PK]    Script Date: 14.05.2020 08:49:18 ******/
ALTER TABLE [dbo].[Plati] ADD  CONSTRAINT [aaaaaPlati_PK] PRIMARY KEY NONCLUSTERED 
(
	[IdPlata] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaUtilizatori_PK]    Script Date: 14.05.2020 08:49:18 ******/
ALTER TABLE [dbo].[Utilizatori] ADD  CONSTRAINT [aaaaaUtilizatori_PK] PRIMARY KEY NONCLUSTERED 
(
	[IdUtilizator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Agenti] ADD  CONSTRAINT [DF__Vanzatori__Pocen__7E6CC920]  DEFAULT ((0)) FOR [ProcentComisionVanzari]
GO
ALTER TABLE [dbo].[Marfuri] ADD  CONSTRAINT [DF__Produse__Perisab__0BC6C43E]  DEFAULT ((0)) FOR [Perisabila]
GO
ALTER TABLE [dbo].[Utilizatori] ADD  DEFAULT ((0)) FOR [Blocat]
GO
ALTER TABLE [dbo].[Agenti]  WITH CHECK ADD  CONSTRAINT [FK_Agenti_Utilizatori] FOREIGN KEY([IdUtilizator])
REFERENCES [dbo].[Utilizatori] ([IdUtilizator])
GO
ALTER TABLE [dbo].[Agenti] CHECK CONSTRAINT [FK_Agenti_Utilizatori]
GO
ALTER TABLE [dbo].[Clienti]  WITH CHECK ADD  CONSTRAINT [FK_Clienti_Utilizatori] FOREIGN KEY([IdUtilizator])
REFERENCES [dbo].[Utilizatori] ([IdUtilizator])
GO
ALTER TABLE [dbo].[Clienti] CHECK CONSTRAINT [FK_Clienti_Utilizatori]
GO
ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [BonuriDeCasa_FK00] FOREIGN KEY([MarcaAgent])
REFERENCES [dbo].[Agenti] ([MarcaAgent])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [BonuriDeCasa_FK00]
GO
ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Clienti] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Clienti] ([IdClient])
GO
ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_Clienti]
GO
ALTER TABLE [dbo].[Facturi]  WITH CHECK ADD  CONSTRAINT [FK_Facturi_Furnizori] FOREIGN KEY([CodFurnizor])
REFERENCES [dbo].[Furnizori] ([CodFurnizor])
GO
ALTER TABLE [dbo].[Facturi] CHECK CONSTRAINT [FK_Facturi_Furnizori]
GO
ALTER TABLE [dbo].[FacturiVanzare]  WITH CHECK ADD  CONSTRAINT [FK_FacturiVanzare_Comenzi] FOREIGN KEY([IdComanda])
REFERENCES [dbo].[Comenzi] ([IdComanda])
GO
ALTER TABLE [dbo].[FacturiVanzare] CHECK CONSTRAINT [FK_FacturiVanzare_Comenzi]
GO
ALTER TABLE [dbo].[Marfuri]  WITH CHECK ADD  CONSTRAINT [Produse_FK00] FOREIGN KEY([CodCategorie])
REFERENCES [dbo].[CategoriiMarfuri] ([CodCategorie])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Marfuri] CHECK CONSTRAINT [Produse_FK00]
GO
ALTER TABLE [dbo].[MarfuriVandute]  WITH CHECK ADD  CONSTRAINT [FK_MarfuriVandute_ProduseMarfuri] FOREIGN KEY([IdProdusMarfa])
REFERENCES [dbo].[ProduseMarfuri] ([IDProdusMarfa])
GO
ALTER TABLE [dbo].[MarfuriVandute] CHECK CONSTRAINT [FK_MarfuriVandute_ProduseMarfuri]
GO
ALTER TABLE [dbo].[MarfuriVandute]  WITH CHECK ADD  CONSTRAINT [ProduseVandute_FK00] FOREIGN KEY([IdComanda])
REFERENCES [dbo].[Comenzi] ([IdComanda])
GO
ALTER TABLE [dbo].[MarfuriVandute] CHECK CONSTRAINT [ProduseVandute_FK00]
GO
ALTER TABLE [dbo].[NIR]  WITH CHECK ADD  CONSTRAINT [FK_NIR_Facturi] FOREIGN KEY([CodFactura])
REFERENCES [dbo].[Facturi] ([CodFactura])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NIR] CHECK CONSTRAINT [FK_NIR_Facturi]
GO
ALTER TABLE [dbo].[NIR]  WITH CHECK ADD  CONSTRAINT [FK_NIR_Gestiuni] FOREIGN KEY([CodMagazie])
REFERENCES [dbo].[Magazii] ([CodMagazie])
GO
ALTER TABLE [dbo].[NIR] CHECK CONSTRAINT [FK_NIR_Gestiuni]
GO
ALTER TABLE [dbo].[Plati]  WITH CHECK ADD  CONSTRAINT [FK_Plati_Comenzi] FOREIGN KEY([IdComanda])
REFERENCES [dbo].[Comenzi] ([IdComanda])
GO
ALTER TABLE [dbo].[Plati] CHECK CONSTRAINT [FK_Plati_Comenzi]
GO
ALTER TABLE [dbo].[ProduseFacturate]  WITH CHECK ADD  CONSTRAINT [FK_ProduseFacturate_Facturi] FOREIGN KEY([CodFactura])
REFERENCES [dbo].[Facturi] ([CodFactura])
GO
ALTER TABLE [dbo].[ProduseFacturate] CHECK CONSTRAINT [FK_ProduseFacturate_Facturi]
GO
ALTER TABLE [dbo].[ProduseFacturate]  WITH CHECK ADD  CONSTRAINT [FK_ProduseFacturate_ProduseFurnizori] FOREIGN KEY([CodProdus])
REFERENCES [dbo].[ProduseFurnizori] ([CodProdus])
GO
ALTER TABLE [dbo].[ProduseFacturate] CHECK CONSTRAINT [FK_ProduseFacturate_ProduseFurnizori]
GO
ALTER TABLE [dbo].[ProduseMarfuri]  WITH CHECK ADD  CONSTRAINT [FK_ProduseMarfuri_Marfuri] FOREIGN KEY([IdMarfa])
REFERENCES [dbo].[Marfuri] ([IdMarfa])
GO
ALTER TABLE [dbo].[ProduseMarfuri] CHECK CONSTRAINT [FK_ProduseMarfuri_Marfuri]
GO
ALTER TABLE [dbo].[ProduseMarfuri]  WITH CHECK ADD  CONSTRAINT [FK_ProduseMarfuri_ProduseFurnizori] FOREIGN KEY([CodProdus])
REFERENCES [dbo].[ProduseFurnizori] ([CodProdus])
GO
ALTER TABLE [dbo].[ProduseMarfuri] CHECK CONSTRAINT [FK_ProduseMarfuri_ProduseFurnizori]
GO
ALTER TABLE [dbo].[ProduseReceptionate]  WITH CHECK ADD  CONSTRAINT [FK_ProduseReceptionate_NIR] FOREIGN KEY([CodNIR])
REFERENCES [dbo].[NIR] ([CodNIR])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProduseReceptionate] CHECK CONSTRAINT [FK_ProduseReceptionate_NIR]
GO
ALTER TABLE [dbo].[ProduseReceptionate]  WITH CHECK ADD  CONSTRAINT [FK_ProduseReceptionate_ProduseFurnizori] FOREIGN KEY([CodProdus])
REFERENCES [dbo].[ProduseFurnizori] ([CodProdus])
GO
ALTER TABLE [dbo].[ProduseReceptionate] CHECK CONSTRAINT [FK_ProduseReceptionate_ProduseFurnizori]
GO
ALTER TABLE [dbo].[Marfuri]  WITH CHECK ADD  CONSTRAINT [ck_VerificarePrecedentaPret] CHECK  (([PretMinVanzare]<[PretMaxVanzare]))
GO
ALTER TABLE [dbo].[Marfuri] CHECK CONSTRAINT [ck_VerificarePrecedentaPret]
GO
ALTER TABLE [dbo].[Marfuri]  WITH CHECK ADD  CONSTRAINT [Ck_VerificarePrecedentPret] CHECK  (([PretMinVanzare]<[PretMaxVanzare]))
GO
ALTER TABLE [dbo].[Marfuri] CHECK CONSTRAINT [Ck_VerificarePrecedentPret]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1800' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⤚挆�䢲熌⺎䑂Ӄ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MarcaVanzator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MarcaVanzator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1635' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'붾싸໙䡻䚜栤ᗈ왤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CNPVanzator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CNPVanzator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'CNPAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ᓪ⠅嬗䰇�䓹粻鼳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Nume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Nume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Nume'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'₟ꑂꭝ䶻쾳ᄞ臘⼭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Prenume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Prenume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'Prenume'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1665' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'懗曏欧䩥趔땈맬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DataAngajarii' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DataAngajarii' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'DataAngajarii'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2625' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'쫃ု䢰羡扔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Percent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PocentComisionVanzari' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PocentComisionVanzari' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ProcentComisionVanzari'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2205' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'粡䊷驊作暂篟�곂' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ImaginePersonala' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ImaginePersonala' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti', @level2type=N'COLUMN',@level2name=N'ImaginePersonala'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'19.11.2011 11:00:20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'10.05.2012 22:44:33' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Vanzatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Agenti'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1680' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'曑棳흀䆿ẵ猥〛' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CodCategorie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CodCategorie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CategoriiProduse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3765' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'Ə顎抸䶐ↅě䴄횦' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DenumireCategorie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DenumireCategorie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CategoriiProduse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2640' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'゘ᝮ먶䃜犯≽ﾺ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DenumireGamaProduse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DenumireGamaProduse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CategoriiProduse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri', @level2type=N'COLUMN',@level2name=N'DenumireGamaProduse'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'19.11.2011 11:06:10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'15.02.2012 21:40:04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CategoriiProduse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriiMarfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ﰶ䴪䫪Ƨ撚隩ᬒ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'NrBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'NrBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BonuriDeCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1950' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ۀ�푳䲭䶡酮簖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'dd/mm/yyyy hh:nn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DataOraBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DataOraBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BonuriDeCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'DataComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'洁ੰ썗䯤钜姧떇' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'1440;1440;1440;1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'5760twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'SELECT Vanzatori.MarcaVanzator, Vanzatori.CNPVanzator, Vanzatori.Nume, Vanzatori.Prenume
FROM Vanzatori
ORDER BY Nume, Prenume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MarcaVanzator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MarcaVanzator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BonuriDeCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi', @level2type=N'COLUMN',@level2name=N'MarcaAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'19.11.2011 11:13:53' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'15.02.2012 21:40:04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BonuriDeCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'43' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comenzi'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㕼善뢧䘳㢤؃➋盤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IdProdus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IdProdus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'IdMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㫹Ꟙ䄿�㎞淚ᷬ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codul afisat al produsului.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CodIntern' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CodIntern' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodIntern'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2745' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'친픴怗䵱뺹阺㭍铩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Denumire' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Denumire' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'DenumireMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2235' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⁑願캎䨰辇閍闉굇' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modul de prezentare al unei unitati de produs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'0twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'Kg;L;M;Buc;Pachet;Cutie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Value List' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cantitate per unitate masura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cantitate per unitate masura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Cantitate_per_unitate_masura'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1305' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'븒떃䮑먗葌䟑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Descriere' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Descriere' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Descriere'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2700' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'晛겁譏䕝횈펡꬀ᵛ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numarul de zile de valabilitate a produsului.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'TermenValabilitate(zile)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'TermenValabilitate(zile)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'TermenValabilitate'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1230' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ⓒ㬉䂮㍈䭛◚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Daca produsul este perisabil sa nu.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Perisabil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Perisabil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'Perisabila'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1680' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'潣˹魑䬣宱䌞ᎇ댩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'1440;1440;1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'4320twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'SELECT CategoriiProduse.CodCategorie, CategoriiProduse.DenumireCategorie, CategoriiProduse.DenumireGamaProduse
FROM CategoriiProduse
ORDER BY DenumireCategorie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CodCategorie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CodCategorie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'COLUMN',@level2name=N'CodCategorie'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'19.11.2011 11:03:31' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'15.02.2012 21:40:04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Produse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'44' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add or change a record because a related record is required in table ''CategoriiProduse''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marfuri', @level2type=N'CONSTRAINT',@level2name=N'Produse_FK00'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'耸넼앨䓉溁㈚킢' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'1440;1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'2880twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'SELECT Produse.IdProdus, Produse.Denumire
FROM Produse
ORDER BY Denumire' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IdProdus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IdProdus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ProduseVandute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdProdusMarfa'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'핆鸔赼䥶丆ꑚ幉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'1440;1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'2880twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'SELECT BonuriDeCasa.NrBonCasa, BonuriDeCasa.DataOraBonCasa
FROM BonuriDeCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'NrBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'NrBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ProduseVandute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'堖跇밦䂖銩ꦱ⍊煩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cantitate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cantitate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ProduseVandute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'Cantitate'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'瀥蛰䫒ᶙㅣ窯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,##0.00" lei";-#,##0.00" lei"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PretVanzare' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PretVanzare' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ProduseVandute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute', @level2type=N'COLUMN',@level2name=N'PretVanzare'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'19.11.2011 11:15:55' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'15.02.2012 21:40:04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ProduseVandute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'240' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarfuriVandute'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ⳓိ싐䴵႔꿭뒾跚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IdPlata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IdPlata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Plati' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1860' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'︉胫࿗䤈誒ꞿ⍱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'0twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'Cash;Card;BonuriMasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Value List' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'TipPlata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'TipPlata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Plati' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'TipPlata'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'뛖蜬ꛠ䲒访隒㴆꡵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,##0.00" lei";-#,##0.00" lei"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'SumaPlatita' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'SumaPlatita' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Plati' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'SumaPlatita'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'쇅愫ﱳ䤚풔௴뫋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'1440;1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'2880twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'SELECT BonuriDeCasa.NrBonCasa, BonuriDeCasa.DataOraBonCasa
FROM BonuriDeCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'NrBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'NrBonCasa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Plati' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati', @level2type=N'COLUMN',@level2name=N'IdComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'19.11.2011 11:08:32' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'15.02.2012 21:40:04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Plati' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'51' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Plati'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IdUtilizator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IdUtilizator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Utilizatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'IdUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'NumeUtilizator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'NumeUtilizator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Utilizatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'NumeUtilizator'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Parola' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Parola' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Utilizatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Parola'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Blocat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Blocat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Utilizatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'Blocat'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1048' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DataCrearii' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DataCrearii' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Utilizatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori', @level2type=N'COLUMN',@level2name=N'DataCrearii'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10.05.2012 20:54:31' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'10.05.2012 20:54:31' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Utilizatori' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Utilizatori'
GO
