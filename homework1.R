#연습문제 : 공공데이터~데이터 분석 수업까지 사용한 데이터셋으로
# ggplot2를 활용하여 플롯 그리기
# 제목,범례, 포인트, 텍스트, 테마 등 최대한 다향하게 사용
# R 그래프 갤러리 참조
# 17:00 까지 작성한 것을 pdf로 작성하여 제출
# Joonion@gmail.com

fee <- read.csv("subwayfee.csv")


library(ggplot2)

p <- ggplot(fee,aes(유임승차,무임승차)) +
  geom_point(alpha = 0.5,mapping = aes(color = 지하철역)) + 
  geom_smooth(color = "red",se = F)

p + 
  labs(title = "유임 및 무임승차 대비 그래프",
         subtitle = "승차 유형의 분포 정도 확인하기",
         caption = "지하철 요금 납부를 성실히 합시다.",
         x =  "유임 승차",
         y = "무임 승차",
         color = "지하철역") + 
  theme(plot.title = element_text(size=18,
                                  face="bold",
                                  color="steelblue")) + 
  theme(plot.subtitle = element_text(size=12,
                                  face="bold",
                                  color="tomato"))

pdf.options(family = "Korea1deb")
ggsave(file="HW_result.pdf",
       width = 1920, height = 1080, units = "px")

