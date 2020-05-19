
CREATE VIEW vListaMarfuri AS
Select pm.CodProdus
,m.PretMaxVanzare
,m.DenumireMarfa
,m.Descriere
,m.Imagine
,m.IdMarfa
,cm.DenumireCategorie
from ProduseMarfuri pm 
join Marfuri m on pm.IdMarfa = m.IdMarfa
join CategoriiMarfuri cm on cm.CodCategorie = m.CodCategorie
--order by cm.DenumireCategorie, m.DenumireMarfa

