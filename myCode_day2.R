
library(ggplot2)

p <- ggplot(mpg,aes(displ,hwy))+geom_point(aes(color = class)) + geom_smooth(se = F)
p

p + labs(title = "Fuel Efficiency vs Engine Size",
         subtitle = "서브 타이틀",
         caption = "설명명님 한판해요",
         x=  "엔진 크기",
         y = "연비",
         color = "차량 유형") #color 탭의 기본 설명은 class로 되어 있음


library(magrittr)


best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)


p + geom_text(aes(label = model), 
              data = best_in_class)

df <- mpg[,c(2,3,9,11)]

df %>% 
  group_by(class) %>%
  filter(hwy > 30)


df %>% 
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)


worst_in_class <- df %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

worst_in_class


df.trim <- df %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)
df.trim


p + geom_text(data = df.trim, aes (label = model))

p + geom_label(data = df.trim, 
               aes(label = model),
               nudge_y = 2 , alpha = 0.5)

label <-  tibble(
  displ = Inf,hwy = Inf,
  label = "집에 가고 싶다"
)

p + geom_text(data = label,
              aes(label = label),
              vjust = "top",
              hjust = "right")



p + theme(legend.position =  "left")
p + theme(legend.position =  "right")
p + theme(legend.position =  "top")
p + theme(legend.position =  "bottom")

p + theme(legend.position = "bottom") +
  guides(color = guide_legend(nrow = 1, 
                              override.aes = list(size = 4)))

p + theme_classic()
p + theme_bw()
p + theme_light()
p + theme_linedraw()
p + theme_dark()
p + theme_minimal()
p + theme_gray()
p + theme_void()

# 레전드까지 없애기
p + theme_void() + theme(legend.position = "none")


ggsave(file="myfigure.jpg", 
       width = 1920, height = 1080, units = "px")


#Library
library(networkD3)
library(dplyr)

# Make a connection data frame
links <- data.frame(
  source=c("group_A","group_A", "group_B", "group_C", "group_C", "group_E"), 
  target=c("group_C","group_D", "group_E", "group_F", "group_G", "group_H"), 
  value=c(2,3, 2, 3, 1, 3)
)

# From these flows we need to create a node data frame:
# it lists every entities involved in the flow
nodes <- data.frame(
  name=c(as.character(links$source), as.character(links$target)) %>% 
    unique()
)

# With networkD3, connection must be provided using id, 
# not using real name like in the links dataframe.. So we need to reformat it.
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1


# prepare color scale: I give one specific color for each node.
my_color <- 'd3.scaleOrdinal() 
.domain(["group_A", "group_B","group_C", "group_D", "group_E", "group_F", "group_G", "group_H"]) 
.range(["blue", "blue" , "blue", "red", "red", "yellow", "purple", "purple"])'

# Make the Network. I call my colour scale with the colourScale argument
p <- sankeyNetwork(Links = links, 
                   Nodes = nodes, 
                   Source = "IDsource", 
                   Target = "IDtarget", 
                   Value = "value", 
                   NodeID = "name", 
                   colourScale=my_color)
p

# save the widget
# library(htmlwidgets)
# saveWidget(p, file=paste0( getwd(), "/HtmlWidget/sankeyColor1.html"))


install.packages("gapminder")
library(gapminder)
str(gapminder)

ggplot(gapminder, 
       aes(gdpPercap, lifeExp, color = continent)) +
  geom_point(alpha = 0.5) +
  scale_x_log10(labels = scales::dollar) + #크기 척도룰 log10 으로
  labs(title = "GapMinder: GDP vs Life Expectancy",
       x = "GDP per capita", y = "Life Expectancy") +
  theme(plot.title = element_text(size=18,
                                  face="bold",
                                  color="steelblue"))


ggsave(file="gapminder.jpg", 
       width = 1920, height = 1080, units = "px")

#점의 크기를 인구수(pop)에 대비시켜라.

ggplot(gapminder, 
       aes(gdpPercap, lifeExp,
           color = continent)) +
  geom_point(alpha = 0.5,mapping = aes(size = pop)) +
  scale_x_log10(labels = scales::dollar) + #크기 척도룰 log10 으로
  labs(title = "GapMinder: GDP vs Life Expectancy",
       x = "GDP per capita", y = "Life Expectancy") +
  theme(plot.title = element_text(size=18,
                                  face="bold",
                                  color="steelblue"))


#점의 크기를 인구수(pop)에 대비시켜라. (다른 방법)

ggplot(gapminder, 
       aes(gdpPercap, lifeExp,
           color = continent,
           size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10(labels = scales::dollar) + #크기 척도룰 log10 으로
  labs(title = "GapMinder: GDP vs Life Expectancy",
       x = "GDP per capita", 
       y = "Life Expectancy") +
  theme(plot.title = element_text(size=18,
                                  face="bold",
                                  color="steelblue"))