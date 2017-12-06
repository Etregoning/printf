/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   format_check.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etregoni <etregoni@student.42.us.org>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/29 20:32:49 by etregoni          #+#    #+#             */
/*   Updated: 2017/11/29 20:32:50 by etregoni         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void format_check(const char *format, va_list arg)
{
	char *s;

	s = 0;
	if (*format++ == '%')
	{
		if (*format == 'c')
		{
			s = va_arg(arg, char *);
			ft_putstr(s);
		}
	}

}
