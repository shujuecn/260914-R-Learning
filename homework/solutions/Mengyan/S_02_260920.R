# 作业 02 学生答案：Mengyan
# 题目见 homework/questions/Q_02_260920.R（题 1–4）
# 工作目录为项目根目录，逐行带中文注释。

# 题一

library(tidyverse)
library(rio) 
your_name = "Mengyan"
dir.create(file.path("homework", "outputs", "Mengyan"), recursive = TRUE, showWarnings = FALSE)
mff = import("data/01_base_tidyverse/MFF-TDF.xlsx")

# 题二

mff[, c("腰围","臀围", "体重")] |> as.matrix() |> colMeans() |> round(2) |> print()

# 题三
mff[, c("年龄", "体重")] |> as.matrix() |> as.data.frame() |> as_tibble() |> str()

# 题四
mff_top = mff |> 
  select(-contains(c("收缩压","舒张压"))) |> 
  mutate(bmi = 体重 / (身高 / 100)^2) |> 
  filter(bmi > mean(bmi))
out_path = file.path("homework", "outputs", "Mengyan", "mff_02_top_bmi.csv")
readr::write_excel_csv(mff_top, out_path)


