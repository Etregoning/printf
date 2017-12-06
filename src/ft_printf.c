/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etregoni <etregoni@student.42.us.org>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/29 16:38:17 by etregoni          #+#    #+#             */
/*   Updated: 2017/11/29 16:38:21 by etregoni         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_printf(const char *format, ...)
{
	va_list	arg;

	va_start(arg, format);
	while (*format)
	{
		format_check(format, arg);
		format++;
	}
	va_end(arg);
	return (0);
}
