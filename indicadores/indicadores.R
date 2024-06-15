library(Compind)

dataset <- read.csv("dataset.csv")
indic_col <- names(dataset[,-1])

CI_all <- ci_factor_mixed(dataset[,-1],indic_col,method="ALL", dim = 5)

w <- CI_all$ci_factor_est

norm <- function(x){
  x <- log(x^2)
  (x-mean(x,na.rm=T))/sd(x,na.rm=T)
}

scores <- cut(norm(w),c(-10,-2,-1,1,2,10))
length(scores)

dataset$scores <-scores

#ish <- read_sf("/home/marcosrb/school_resilience_app/Dados/Dados/ish_ana.shp")

merge(ish, dataset,by="cobacia") -> ish_final

ggplot()+
  geom_sf(data = ish_final,aes(fill=scores), col=NA)+
  scale_fill_manual(
    values = c('#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00')
  )+
  theme_void()

ggsave("mapa_resiliência.png",width = 10, height = 10)
