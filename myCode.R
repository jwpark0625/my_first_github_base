anscombe
str(anscombe)

anscombe[,c("x1","y1")]
df <- anscombe

plot(df$x1, df$y1, pch = 19, col = "tomato")
abline(lm(y1 ~ x1, data = df), col = "blue")

plot(df$x2, df$y2, pch = 19, col = "tomato")
abline(lm(y2 ~ x2, data = df), col = "blue")

plot(df$x3, df$y3, pch = 19, col = "tomato")
abline(lm(y3 ~ x3, data = df), col = "blue")

plot(df$x4, df$y4, pch = 19, col = "tomato")
abline(lm(y4 ~ x4, data = df), col = "blue")
par(mfrow = c(1,1))


install.packages("tidyverse")
library("tidyverse")

str(mpg)
?mpg

#배경 설정
p <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy))

p + geom_point()

geom_point()

colors()
#색상 구분
p + geom_point(mapping = aes(color = class))
               
# 크기와 색깔 구분
p + geom_point(mapping = aes(color = class, size = class))

# 점의 형태 추가
p + geom_point(mapping = aes(color = class,shape = class))

# 크기 구분에 alpha(투명도) 추가
p + geom_point(mapping = aes(color = class, size = class, alpha = 0.3))

# 클래스에 따라 여러 면(facet)으로 나눠줌
p + geom_point(color="tomato") + facet_wrap(~ class, nrow = 2)
# nrow : 행 갯수

p + geom_point(color="tomato") + facet_grid(drv ~ cyl)

table(mpg$drv)

?mpg


table(mpg$cyl)

par(mfrow = c(1,1))

barplot(table(mpg$cyl), col = "steelblue")


p + geom_point(color="blue") + geom_smooth(color="cyan")

p + geom_point(mapping = aes(color = class)) + geom_smooth(color = "cyan")


library(ggplot2)
data("diamonds")
str(diamonds)

?diamonds

head(diamonds)

# p에 gglot 정보 저장
p <- ggplot(data = diamonds)

p + geom_bar(mapping = aes(x = cut), fill = "steelblue")
p + stat_count(mapping = aes(x = cut),fill = "steelblue")

p + geom_bar(mapping = aes(x = cut, fill = clarity))

p + geom_bar(mapping = aes(x = cut, fill = clarity), 
             position = "fill")

p + geom_bar(mapping = aes(x = cut, fill = clarity), 
             position = "dodge")


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, 
                           y = hwy, 
                           color = class,
                           size = class,
                           alpha = 0.3), 
             position = "jitter")


p <- ggplot(data = mpg,
            mapping = aes(x = class, y = hwy))
p + geom_boxplot(fill = "lightyellow")

p + geom_boxplot(fill = "lightyellow") + coord_flip()

p <- ggplot(data = diamonds, aes(x = cut, fill = cut))

p + geom_bar(show.legend = F, width = 1)


p + geom_bar(show.legend = F, width = 1) +
  labs(x = NULL, y = NULL) +
  theme(aspect.ratio = 1) +
  coord_polar()


world <- map_data("world")
ggplot(world, aes(long, lat, group = group)) +
  geom_polygon(fill = "lightyellow", color = "blue")

nz <- map_data("nz")
ggplot(world, aes(long, lat, group = group)) +
  geom_polygon(fill = "orange", color = "tomato")

