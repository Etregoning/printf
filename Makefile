# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: etregoni <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/21 14:58:27 by etregoni          #+#    #+#              #
#    Updated: 2017/10/07 19:13:28 by etregoni         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_printf
CFLAGS = -Wall -Werror -Wextra -g

SRC_FILES = ft_printf.h
OBJ_FILES = $(SRC_FILES:.c=.o)

SRC_DIR = ./src/
OBJ_DIR = ./obj/
INC_DIR = ./include/
MLX_DIR = ./mlx/
LIBFT_DIR = ./libft/

SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))
LIBFT = $(addprefix $(LIBFT_DIR), libft.a)

LINK = -L $(LIBFT_DIR) -lft

all: obj $(LIBFT) $(NAME)

obj:
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o:$(SRC_DIR)%.c
	@gcc $(CFLAGS) -I $(LIBFT_DIR) -I $(INC_DIR) -o $@ -c $<

$(LIBFT):
	@echo "\033[32mCompiling libft...\033[0m"
	@make -C $(LIBFT_DIR)
	@echo "\033[1;4;32mlibft created.\033[0m"

$(NAME): $(OBJ)
	@echo "\033[32mCompiling $(NAME)...\033[0m"
	@gcc $(OBJ) $(LINK) -lm -o $(NAME)
	@echo "\033[1;4;32m$(NAME) Created.\033[0m"

clean:
	@echo "\033[31mRemoving objects...\033[0m"
	@rm -rf $(OBJ_DIR)
	@make -C $(LIBFT_DIR) clean
	@echo "\033[1;4;31mObjects removed!\033[0m"

fclean: clean
	@echo "\033[31mRemoving $(NAME)...\033[0m"
	@rm -f $(NAME)
	@make -C $(LIBFT_DIR) fclean
	@echo "\033[1;4;31m$(NAME) removed!\033[0m"

re: fclean all

.PHONY: clean fclean all re
