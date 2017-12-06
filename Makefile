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

NAME = libftprintf.a
CFLAGS = -Wall -Werror -Wextra -g

SRC_FILES = ft_printf.c format_check.c
LIBFT_FILES = ft_putstr.c ft_putendl.c
SRC_OBJ_FILES = $(SRC_FILES:.c=.o)
LIBFT_OBJ_FILES = $(LIBFT_FILES:.c=.o)

SRC_DIR = ./src/
INC_DIR = ./include/
LIBFT_DIR = ./libft/
OBJ_DIR = ./obj/


SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ = $(addprefix $(OBJ_DIR), $(SRC_OBJ_FILES))
OBJ_LIBFT = $(addprefix $(OBJ_DIR), $(LIBFT_OBJ_FILES))

all: obj $(NAME)

obj:
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o:$(SRC_DIR)%.c
	@gcc $(CFLAGS) -I $(INC_DIR) -o $@ -c $<

$(OBJ_DIR)%.o:$(LIBFT_DIR)%.c
	@gcc $(CFLAGS) -I $(INC_DIR) -o $@ -c $<

$(NAME): $(OBJ) $(OBJ_LIBFT)
	@ar rc $(NAME) $(OBJ) $(OBJ_LIBFT)
	@ranlib $(NAME)

#REMOVE ME BEFORE TURNING IN!

test: $(NAME)
	gcc $(CFLAGS) src/main.c -I $(INC_DIR) -L. -lftprintf -o test

clean:
	@echo "\033[31mRemoving objects...\033[0m"
	@rm -rf $(OBJ_DIR)
	@echo "\033[1;4;31mObjects removed!\033[0m"

fclean: clean
	@echo "\033[31mRemoving $(NAME)...\033[0m"
	@rm -f $(NAME) test
	@rm -rf $(OBJ_DIR)
	@echo "\033[1;4;31m$(NAME) removed!\033[0m"

re: fclean all

.PHONY: clean fclean all re test
