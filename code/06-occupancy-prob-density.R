
# plot a probability of occupancy distribution

# sample from the beta distribution
x <- rbeta(n = 10000, shape1 = 5, shape2 = 10)
y <- rbeta(n = 10000, shape1 = 15, shape2 = 10)

mean(x)
mean(y)

# load ggplot2
library(ggplot2)

# load relevant theme
source("theme-minimal.R")

p1 <-
  ggplot(data = dplyr::tibble(v1 = x),
       mapping = aes(x = v1)) +
  geom_density(fill = "grey", bw = 0.04, alpha = 0.6) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 3.9) ) +
  ylab(NULL) +
  xlab(NULL) +
  theme_minimal_bw() +
  theme(panel.border = element_rect(colour = "black", size = 1, fill = NA),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())

# export these plots
ggsave(filename = "figures-tables/fig-density.png", p1, dpi = 600,
       width = 6, height = 9, unit = "cm")


# Bayesian updated distribution
p2 <-
  ggplot() +
  geom_density(data = dplyr::tibble(v1 = x),
               mapping = aes(x = v1),
               fill = "grey", bw = 0.04, alpha = 0.6) +
  geom_density(data = dplyr::tibble(v1 = y),
               mapping = aes(x = v1),
               fill = "darkgrey", bw = 0.04, alpha = 0.6) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 3.9) ) +
  ylab(NULL) +
  xlab(NULL) +
  theme_minimal_bw() +
  theme(panel.border = element_rect(colour = "black", size = 1, fill = NA),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())
plot(p2)

# export these plots
ggsave(filename = "figures-tables/fig-density-updated.png", p2, dpi = 600,
       width = 7.5, height = 9, unit = "cm")



