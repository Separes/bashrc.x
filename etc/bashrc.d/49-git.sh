# ~/.local/bashrc.x/etc/bashrc.d/49-git.sh
#
# This file is part of bashrc.x.
#
# bashrc.x is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# bashrc.x is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with bashrc.x.  If not, see <http://www.gnu.org/licenses/>.
#
# @package   bashrc.x
# @author    Snakevil Zen <zsnakevil@gmail.com>
# @copyright © 2012 szen.in
# @license   http://www.gnu.org/licenses/gpl.html

export __BASHRC_X_PROMPT_GIT_=""

__BASHRC_X_PROMPT_GIT() {
  _p=(1 "")
  [ "${__BASHRC_X_PROMPT_OLDPWD}" == "${PWD}" ] \
    || __BASHRC_X_PROMPT_GIT_=`'git' symbolic-ref HEAD 2> /dev/null \
      | 'awk' -F'/' '{print $3}'`
  [ -z "${__BASHRC_X_PROMPT_GIT_}" ] && {
    'alias' gcd &> /dev/null && 'unalias' gcd || return
  } || {
    _p[1]="*g\\[\\e[0;32m\\]${__BASHRC_X_PROMPT_GIT_}\\[\\e[1;30m\\]"
    'alias' gcd="cd '`'git' rev-parse --show-toplevel 2> /dev/null`'"
  }
}

# vim: se ft=sh ff=unix fenc=utf-8 sw=2 ts=2 sts=2: