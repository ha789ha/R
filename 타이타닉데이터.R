library(dplyr)
library(ggplot2)
library(reshape2)

Passenger = read.csv(r"(C:\Users\hahav\Downloads\gender_submission.csv)")
sex = read.csv(r"(C:\Users\hahav\Downloads\test.csv)")
data = merge(Passenger, sex, by = "PassengerId")
xnames(data)

## 나의 궁금증

# 1번 성별에 따라 생존율이 다를까??
table(data$Survived, data$Sex) # 분석결과 남자는 모두 사망, 여자는 모두 생존

# 그렇다면 객실 등급에 따른 생존율은?
s_data = data[c(2, 3)]

f_data = s_data %>%
   group_by(Pclass) %>%
   summarise(live = sum(Survived ==1)/sum(Pclass))

ggplot(data = f_data,
       aes(x = Pclass,
           y = live)) +
   geom_bar(stat = "identity") ## 객실의 등급이 올라갈수록 생존율이 올라가는 것 확인





