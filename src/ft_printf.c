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
	t_ftprintf *ft;

	if (!(ft = (t_ftprintf*)ft_memalloc(sizeof(t_ftprintf))))
		ft_error("Failed to allocate memory for main struct");
	if (!(ft->fmt = (t_format*)ft_memalloc(sizeof(t_format))))
		ft_error("Failed to allocate memory for format struct");
	ft->fmt->f = format;
	va_start(arg, format);
	while (ft->fmt->f)
	{
		format_check(ft, arg);
		ft->fmt->f++;
	}
	va_end(arg);
	return (0);
}
