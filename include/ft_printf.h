/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etregoni <etregoni@student.42.us.org>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/29 16:45:33 by etregoni          #+#    #+#             */
/*   Updated: 2017/11/29 16:45:36 by etregoni         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H

# include <stdarg.h>
# include <stdio.h>
# include "libft.h"

typedef struct	s_format
{
	char	*plaintext;
	const char	*f;
}				t_format;

typedef struct	s_ftprintf
{
	t_format *fmt;
}				t_ftprintf;

int	ft_printf(const char *format, ...);
void format_check(const char *format, va_list arg);

#endif
