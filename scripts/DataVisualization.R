#Visualizing dat.new using gglot

#basic format for ggplot
#ggplot(data, aes(x = variable, y = variable1)) +
#  geom_col()

#1 barplot of BRCA1 gene across all samples
 dat.new %>%
   filter( gene == 'BRCA1') %>%
   ggplot(., aes(x = samples, y=FPKM, fill = tissue)) +
   geom_col()

 #2 Density plot of BRCA1 gene on FPKM values
 dat.new %>%
   filter( gene == 'BRCA1') %>%
   ggplot(., aes(x = FPKM, fill = tissue)) +
   geom_density(alpha = 0.3)
 
 #3. boxplot
 dat.new %>%
   filter( gene == 'BRCA1') %>%
   ggplot(., aes(x = metastasis,y = FPKM)) +
   geom_boxplot()

 #scatterplot to check reltionship btn brca1 and brca2
 dat.new %>%
   filter( gene == 'BRCA1' | gene == 'BRCA2') %>%
   spread (key = gene, value = FPKM)%>%
 ggplot(., aes(x = BRCA1,y = BRCA2, colour = tissue)) + #color cretes diff gradients for both tissue type 
   geom_point() + 
   #fits a gradient line to see slope 
   geom_smooth(method = 'lm',, se= FALSE)
 
 
 #heatmap
 genes.of.interest <- c('BRCA1', 'BRCA2', 'TP53', 'ALK', 'MYCN')
 
 p <- dat.new %>%
   filter(gene %in% genes.of.interest)%>%
   ggplot(., aes(x = samples, y= gene, fill = FPKM )) +
  geom_tile() +
   #reduce colours to more visible tints
   scale_fill_gradient(low = 'white', high = 'red')

 #save plot command
 ggsave(p, filename = 'heatmap_save1.pdf', width = 10, height = 8) 
 