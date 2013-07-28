/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2013 by the FusionInventory Development Team.

   http://www.fusioninventory.org/ http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory Agent Installer for Microsoft Windows is free software;
   you can redistribute it and/or modify it under the terms of the GNU
   General Public License as published by the Free Software Foundation;
   either version 2 of the License, or (at your option) any later version.


   FusionInventory Agent Installer for Microsoft Windows is distributed in
   the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
   PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
   or see <http://www.gnu.org/licenses/>.

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\HelpPageLangStrings.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_HELPPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_HELPPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; HelpPage_Text_Help
LangString HelpPage_Text_Help ${LANG_ENGLISH} "Help"
LangString HelpPage_Text_Help ${LANG_FRENCH} "fHelp"
LangString HelpPage_Text_Help ${LANG_SPANISH} "Ayuda"

; HelpPage_Text_SyntaxError
LangString HelpPage_Text_SyntaxError ${LANG_ENGLISH} "Syntax Error"
LangString HelpPage_Text_SyntaxError ${LANG_FRENCH} "fSyntax Error"
LangString HelpPage_Text_SyntaxError ${LANG_SPANISH} "Error de Sintaxis"

; HelpPage_SubText
LangString HelpPage_SubText ${LANG_ENGLISH} "Command Line Help"
LangString HelpPage_SubText ${LANG_FRENCH} "fCommand Line Help"
LangString HelpPage_SubText ${LANG_SPANISH} "Ayuda de la línea de comandos"

; HelpPage_Label1_Text
LangString HelpPage_Label1_Text ${LANG_ENGLISH} "Press Page Down to see the rest of the help."
LangString HelpPage_Label1_Text ${LANG_FRENCH} "fPress Page Down to see the rest of the help."
LangString HelpPage_Label1_Text ${LANG_SPANISH} "Presione Avanzar Página para ver el resto de la ayuda."

; HelpPage_Botton1_Text
LangString HelpPage_Button1_Text ${LANG_ENGLISH} "&Print"
LangString HelpPage_Button1_Text ${LANG_FRENCH} "f&Print"
LangString HelpPage_Button1_Text ${LANG_SPANISH} "&Imprimir"

; HelpPage_CancelButton_Text
LangString HelpPage_CancelButton_Text ${LANG_ENGLISH} "&Finish"
LangString HelpPage_CancelButton_Text ${LANG_FRENCH} "&Fermer"
LangString HelpPage_CancelButton_Text ${LANG_SPANISH} "&Terminar"

; HelpPage_Help_Name
LangString HelpPage_Help_Name ${LANG_ENGLISH} "NAME"
LangString HelpPage_Help_Name ${LANG_FRENCH} "fNAME"
LangString HelpPage_Help_Name ${LANG_SPANISH} "NOMBRE"

; HelpPage_Help_Synopsis
LangString HelpPage_Help_Synopsis ${LANG_ENGLISH} "SYNOPSIS"
LangString HelpPage_Help_Synopsis ${LANG_FRENCH} "fSYNOPSIS"
LangString HelpPage_Help_Synopsis ${LANG_SPANISH} "SINOPSIS"

; HelpPage_Help_Description
LangString HelpPage_Help_Description ${LANG_ENGLISH} "DESCRIPTION"
LangString HelpPage_Help_Description ${LANG_FRENCH} "fDESCRIPTION"
LangString HelpPage_Help_Description ${LANG_SPANISH} "DESCRIPCIÓN"

; HelpPage_Help_Description_Paragraph_1
LangString HelpPage_Help_Description_Paragraph_1 ${LANG_ENGLISH} "This is the list of available options:"
LangString HelpPage_Help_Description_Paragraph_1 ${LANG_FRENCH} "fThis is the list of available options:"
LangString HelpPage_Help_Description_Paragraph_1 ${LANG_SPANISH} "Esta es la lista de las opciones disponibles:"

; HelpPage_Help_Yes
LangString HelpPage_Help_Yes ${LANG_ENGLISH} "Yes"
LangString HelpPage_Help_Yes ${LANG_FRENCH} "fYes"
LangString HelpPage_Help_Yes ${LANG_SPANISH} "Sí"

; HelpPage_Help_No
LangString HelpPage_Help_No ${LANG_ENGLISH} "No"
LangString HelpPage_Help_No ${LANG_FRENCH} "fNo"
LangString HelpPage_Help_No ${LANG_SPANISH} "No"

; HelpPage_Help_Option
LangString HelpPage_Help_Option ${LANG_ENGLISH} "Option"
LangString HelpPage_Help_Option ${LANG_FRENCH} "fOption"
LangString HelpPage_Help_Option ${LANG_SPANISH} "Opción"

; HelpPage_Help_Option_acceptlicense_Paragraph_1
LangString HelpPage_Help_Option_acceptlicense_Paragraph_1 ${LANG_ENGLISH} "You accept and acknowledge that you have read, and understand, the terms and conditions of ${PRODUCT_NAME} ${PRODUCT_VERSION} license. (By default: $R9)"
LangString HelpPage_Help_Option_acceptlicense_Paragraph_1 ${LANG_FRENCH} "fYou accept and acknowledge that you have read, and understand, the terms and conditions of ${PRODUCT_NAME} ${PRODUCT_VERSION} license. (By default: $R9)"
LangString HelpPage_Help_Option_acceptlicense_Paragraph_1 ${LANG_SPANISH} "Acepta y reconoce que ha leído y entendido los términos y condiciones de la licencia de ${PRODUCT_NAME} ${PRODUCT_VERSION}. (Por defecto: $R9)"

; HelpPage_Help_Option_acceptlicense_Paragraph_2
LangString HelpPage_Help_Option_acceptlicense_Paragraph_2 ${LANG_ENGLISH} "You must use this option if you perform the installation in silent mode (\i /S\i0 )."
LangString HelpPage_Help_Option_acceptlicense_Paragraph_2 ${LANG_FRENCH} "fYou must use this option if you perform the installation in silent mode (\i /S\i0 )."
LangString HelpPage_Help_Option_acceptlicense_Paragraph_2 ${LANG_SPANISH} "Debe usar esta opción si realiza la instalación en modo silencioso (\i /S\i0 )."

; HelpPage_Help_Option_add-firewall-exception_Paragraph_1
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_1 ${LANG_ENGLISH} "Adds ${PRODUCT_NAME} to the Windows Firewall exception list. (By default: $R9)"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_1 ${LANG_FRENCH} "fAdd s${PRODUCT_NAME} to the Windows Firewall exception list. (By default: $R9)"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_1 ${LANG_SPANISH} "Añade ${PRODUCT_NAME} a la lista de excepciones del \i Firewall\i0  de Windows. (Por defecto: $R9)"

; HelpPage_Help_Option_add-firewall-exception_Paragraph_2
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_2 ${LANG_ENGLISH} "Todo"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_2 ${LANG_FRENCH} "fTodo"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_2 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_backend-collect-timeout_Paragraph_1
LangString HelpPage_Help_Option_backend-collect-timeout_Paragraph_1 ${LANG_ENGLISH} "Timeout for task Inventory modules execution . (By default: $R9 seconds)"
LangString HelpPage_Help_Option_backend-collect-timeout_Paragraph_1 ${LANG_FRENCH} "fTimeout for task Inventory modules. (By default: $R9 seconds)"
LangString HelpPage_Help_Option_backend-collect-timeout_Paragraph_1 ${LANG_SPANISH} "Tiempo límite para la ejecución de los módulos de la tarea Inventory. (Por defecto: $R9 segundos)"

; HelpPage_Help_Option_ca-cert-dir_Paragraph_1
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_1 ${LANG_ENGLISH} "Absolute path to the certificates authority (CA) directory. (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_1 ${LANG_FRENCH} "fAbsolute path to the certificates authority (CA) directory. (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_1 ${LANG_SPANISH} "Ruta absoluta del directorio de certificados de autoridad (CA). (Por defecto: $R9)"

; HelpPage_Help_Option_ca-cert-file_Paragraph_1
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_1 ${LANG_ENGLISH} "Certificate authority (CA) file name. (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_1 ${LANG_FRENCH} "fCertificate authority (CA) file name. (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_1 ${LANG_SPANISH} "Nombre del archivo del certificado de autoridad (CA). (Por defecto: $R9)"

; HelpPage_Help_Option_ca-cert-file_Paragraph_2
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_2 ${LANG_ENGLISH} "If \i filename\i0  is not expressed as an absolute path, the path will be relative to the directory specified in the option \i /ca-cert-dir\i0 . In any case, \i filename\i0  must have extension \i *.pem\i0  (Privacy Enhanced Mail)."
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_2 ${LANG_FRENCH} "fIf \i filename\i0  is not expressed as an absolute path, the path will be relative to the directory specified in the option \i /ca-cert-dir\i0 . In any case, \i filename\i0  must have extension \i *.pem\i0  (Privacy Enhanced Mail)."
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_2 ${LANG_SPANISH} "Si \i filename\i0  no está expresado como una ruta absoluta, la ruta será relativa al directorio indicado en la opción \i /ca-cert-dir\i0 . En todo caso, \i filename\i0  debe tener extensión \i *.pem\i0  (\i Privacy Enhanced Mail\i0 )."

; HelpPage_Help_Option_ca-cert-uri_Paragraph_1
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_1 ${LANG_ENGLISH} "\i URI\i0  from where to obtain the file of the certificate of authority (CA) indicated in the option \i /ca-cert-file\i0 . (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_1 ${LANG_FRENCH}  "f\i URI\i0  from where to obtain the file of the certificate of authority (CA) indicated in the option \i /ca-cert-file\i0 . (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_1 ${LANG_SPANISH} "\i URI\i0  de donde obtener el archivo del certificado de autoridad (CA) indicado en la opción \i /ca-cert-file\i0 . (Por defecto: $R9)"

; HelpPage_Help_Option_ca-cert-uri_Paragraph_2
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_2 ${LANG_ENGLISH} "The file of certificate authority (CA) will be saved in the base directory retrieved from the path resulting from concatenating \i /ca-cert-dir\i0  and \i /ca-cert-file\i0 , in that order, whether \i /ca-cert-file\i0  is indicated as a relative path, or as the indicated file in \i /ca-cert-file\i0 , in the opposite case."
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_2 ${LANG_FRENCH} "fThe file of certificate authority (CA) will be saved in the base directory retrieved from the path resulting from concatenating \i /ca-cert-dir\i0  and \i /ca-cert-file\i0 , in that order, whether \i /ca-cert-file\i0  is indicated as a relative path, or as the indicated file in \i /ca-cert-file\i0 , in the opposite case."
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_2 ${LANG_SPANISH} "El archivo del certificado de autoridad (CA) será guardado en el directorio base obtenido de la ruta resultante de concatenar \i /ca-cert-dir\i0  y \i /ca-cert-file\i0 , en ese orden, si \i /ca-cert-file\i0  es indicado como una ruta relativa, o como el fichero indicado en \i /ca-cert-file\i0 , en el caso contrario."

; HelpPage_Help_Option_debug_Paragraph_1
LangString HelpPage_Help_Option_debug_Paragraph_1 ${LANG_ENGLISH} "Sets the debug level of the agent. (By default: $R9)"
LangString HelpPage_Help_Option_debug_Paragraph_1 ${LANG_FRENCH} "fSets the debug level of the agent. (By default: $R9)"
LangString HelpPage_Help_Option_debug_Paragraph_1 ${LANG_SPANISH} "Establece el nivel de depuración del agente. (Por defecto: $R9)"

; HelpPage_Help_Option_debug_Paragraph_2
LangString HelpPage_Help_Option_debug_Paragraph_2 ${LANG_ENGLISH} \
"\i level\i0  can be any of the following values:\par \
\par \
\tab 0: Debug off\par \
\tab 1: Normal debug\par \
\tab 2: Full debug"
LangString HelpPage_Help_Option_debug_Paragraph_2 ${LANG_FRENCH} \
"f\i level\i0 can be any of the following values:\par \
\par \
\tab 0: Debug off\par \
\tab 1: Normal debug\par \
\tab 2: Full debug"
LangString HelpPage_Help_Option_debug_Paragraph_2 ${LANG_SPANISH} \
"\i level\i0  puede ser cualquiera de los siguientes valores:\par \
\par \
\tab 0: Sin depuración\par \
\tab 1: Depuración normal\par \
\tab 2: Depuración completa"

; HelpPage_Help_Option_delaytime_Paragraph_1
LangString HelpPage_Help_Option_delaytime_Paragraph_1 ${LANG_ENGLISH} "Sets an initial delay before first contact with a remote destination (see option \i /server\i0 ). This delay is calculated at random between \i limit/2\i0  and \i limit\i0  seconds. (Default: $R9 seconds)"
LangString HelpPage_Help_Option_delaytime_Paragraph_1 ${LANG_FRENCH} "fSets an initial delay before first contact with a remote destination (see option \i /server\i0 ). This delay is calculated at random between \i limit/2\i0  and \i limit\i0  seconds. (Default: $R9 seconds)"
LangString HelpPage_Help_Option_delaytime_Paragraph_1 ${LANG_SPANISH} "Establece una demora inicial antes de primer contacto con un destino remoto (ver opción \i /server\i0 ). Esta demora se calcula al azar entre \i limit/2\i0  y \i limit\i0  segundos. (Por defecto: $R9 segundos)"

; HelpPage_Help_Option_delaytime_Paragraph_2
LangString HelpPage_Help_Option_delaytime_Paragraph_2 ${LANG_ENGLISH} "This option is ignored for remote destinations, after the first contact with each one, in favor of the specific server parameter (PROLOG_FREQ)."
LangString HelpPage_Help_Option_delaytime_Paragraph_2 ${LANG_FRENCH} "fThis option is ignored for remote destinations, after the first contact with each one, in favor of the specific server parameter (PROLOG_FREQ)."
LangString HelpPage_Help_Option_delaytime_Paragraph_2 ${LANG_SPANISH} "Esta opción se omite para los destinos remotos, después del primer contacto con cada uno, en favor del parámetro específico del servidor (PROLOG_FREQ)."

; HelpPage_Help_Option_delaytime_Paragraph_3
LangString HelpPage_Help_Option_delaytime_Paragraph_3 ${LANG_ENGLISH} "This option comes into play only if ${PRODUCT_NAME} runs in server mode (see option \i /execmode\i0 )."
LangString HelpPage_Help_Option_delaytime_Paragraph_3 ${LANG_FRENCH} "fThis option comes into play only if ${PRODUCT_NAME} runs in server mode (see option \i /execmode\i0 )."
LangString HelpPage_Help_Option_delaytime_Paragraph_3 ${LANG_SPANISH} "Esta opción entra en juego únicamente si ${PRODUCT_NAME} se ejecuta en modo servidor (ver opción \i /execmode\i0 )."

; HelpPage_Help_Option_execmode_Paragraph_1
LangString HelpPage_Help_Option_execmode_Paragraph_1 ${LANG_ENGLISH} "Sets the agent execution mode. (By default: $R9)"
LangString HelpPage_Help_Option_execmode_Paragraph_1 ${LANG_FRENCH} "fSets the agent execution mode. (By default: $R9)"
LangString HelpPage_Help_Option_execmode_Paragraph_1 ${LANG_SPANISH} "Establece el modo de ejecución del agente. (Por defecto: $R9)"

; HelpPage_Help_Option_execmode_Paragraph_2
LangString HelpPage_Help_Option_execmode_Paragraph_2 ${LANG_ENGLISH} \
"\i mode\i0  can be any of the following values:\par \
\par \
\tab Service: The agent runs as a Windows Service (always running)\par \
\tab Task: The agent runs as a Windows Task (runs at intervals)\par \
\tab Manual: The agent doesn't run automatically (no \i Service\i0 , no \i Task\i0 )\par \
\tab Current: The agent runs in the same way that the agent already installed runs"
LangString HelpPage_Help_Option_execmode_Paragraph_2 ${LANG_FRENCH} \
"f\i mode\i0  can be any of the following values:\par \
\par \
\tab Service: The agent runs as a Windows Service (always running)\par \
\tab Task: The agent runs as a Windows Task (runs at intervals)\par \
\tab Manual: The agent doesn't run automatically (no \i Service\i0 , no \i Task\i0 )\par \
\tab Current: The agent runs in the same way that the agent already installed runs"
LangString HelpPage_Help_Option_execmode_Paragraph_2 ${LANG_SPANISH} \
"\i mode\i0  puede ser cualquiera de los siguientes valores:\par \
\par \
\tab Service: El agente se ejecuta como un Servicio Windows (siempre en ejecución)\par \
\tab Task: El agente se ejecuta como una Tarea Windows (ejecución a intervalos)\par \
\tab Manual: El agente no se ejecuta automáticamente (ni \i Service\i0 , ni \i Task\i0 )\par \
\tab Current: El agente se ejecuta del mismo modo que se ejecuta el agente ya instalado"

; HelpPage_Help_Option_execmode_Paragraph_3
LangString HelpPage_Help_Option_execmode_Paragraph_3 ${LANG_ENGLISH} \
"The mode \i Service\i0  is known also as \i server mode\i0 .\par \
\par \
The mode \i Task\i0  is only available on systems Windows XP (or higher) and Windows Server 2003 (or higher).\par \
\par \
In the case of an installation \i from-scratch\i0  (see option \i /installtype\i0 ), the mode \i Current\i0  is a synonym of \i Service\i0 ."
LangString HelpPage_Help_Option_execmode_Paragraph_3 ${LANG_FRENCH} \
"fThe mode \i Service\i0  is known also as \i server mode\i0 .\par \
\par \
The mode \i Task\i0  is only available on systems Windows XP (or higher) and Windows Server 2003 (or higher).\par \
\par \
In the case of an installation \i from-scratch\i0  (see option \i /installtype\i0 ), the mode \i Current\i0  is a synonym of \i Service\i0 ."
LangString HelpPage_Help_Option_execmode_Paragraph_3 ${LANG_SPANISH} \
"El modo \i Service\i0  es conocido también como \i modo servidor\i0 .\par \
\par \
El modo \i Task\i0  solo está disponible en sistemas Windows XP (o superior) y Windows Server 2003 (o superior).\par \
\par \
En el caso de una instalación \i from-scratch\i0  (ver opción \i /installtype\i0 ), el modo \i Current\i0  es un sinónimo de \i Service\i0 ."

; HelpPage_Help_Option_help_Paragraph_1
LangString HelpPage_Help_Option_help_Paragraph_1 ${LANG_ENGLISH} "This help. Whether \i /help\i0  is present, shows the help and aborts the installation. You could prefer make use of \i /dumphelp\i0  instead \i /help\i0  to get information. \i /dumphelp\i0  creates a RTF file with this help, and aborts the installation."
LangString HelpPage_Help_Option_help_Paragraph_1 ${LANG_FRENCH} "fThis help. Whether \i /help\i0  is present, shows the help and aborts the installation. You could prefer make use of \i /dumphelp\i0  instead \i /help\i0  to get information. \i /dumphelp\i0  creates a RTF file with this help, and aborts the installation."
LangString HelpPage_Help_Option_help_Paragraph_1 ${LANG_SPANISH} "Esta ayuda. Si \i /help\i0  está presente, muestra la ayuda y aborta la instalación. Podría preferir hacer uso de \i /dumphelp\i0  en su lugar \i /help\i0  para obtener información. \i /dumphelp\i0  crea un archivo RTF con esta ayuda y aborta la instalación."

; HelpPage_Help_Option_html_Paragraph_1
LangString HelpPage_Help_Option_html_Paragraph_1 ${LANG_ENGLISH} "Save the inventory as HTML instead of XML. (By default: $R9)"
LangString HelpPage_Help_Option_html_Paragraph_1 ${LANG_FRENCH} "fSave the inventory as HTML instead of XML. (By default: $R9)"
LangString HelpPage_Help_Option_html_Paragraph_1 ${LANG_SPANISH} "Graba el inventario como HTML en lugar de XML. (Por defecto: $R9)"

; HelpPage_Help_Option_html_Paragraph_2
LangString HelpPage_Help_Option_html_Paragraph_2 ${LANG_ENGLISH} "This option comes into play only if you have also indicated a value for the option \i /local\i0 ."
LangString HelpPage_Help_Option_html_Paragraph_2 ${LANG_FRENCH} "fThis option comes into play only if you have also indicated a value for the option \i /local\i0 ."
LangString HelpPage_Help_Option_html_Paragraph_2 ${LANG_SPANISH} "Esta opción entra en juego únicamente si se ha indicado también un valor para la opción \i /local\i0 ."

; HelpPage_Help_Option_httpd_Paragraph_1
LangString HelpPage_Help_Option_httpd_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \i /no-httpd\i0 . See option \i /no-httpd\i0  for more information."
LangString HelpPage_Help_Option_httpd_Paragraph_1 ${LANG_FRENCH} "fThis option is the opposite of \i /no-httpd\i0 . See option \i /no-httpd\i0  for more information."
LangString HelpPage_Help_Option_httpd_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \i /no-httpd\i0 . Vea opción \i /no-httpd\i0  para más información."

; HelpPage_Help_Option_httpd-ip_Paragraph_1
LangString HelpPage_Help_Option_httpd-ip_Paragraph_1 ${LANG_ENGLISH} "IP address by which the embedded web server should listen. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-ip_Paragraph_1 ${LANG_FRENCH} "fIP address by which the embedded web server should listen. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-ip_Paragraph_1 ${LANG_SPANISH} "Dirección IP por la que el servidor web integrado debería escuchar. (Por defecto: $R9)"

; HelpPage_Help_Option_httpd-port_Paragraph_1
LangString HelpPage_Help_Option_httpd-port_Paragraph_1 ${LANG_ENGLISH} "IP port by which the embedded web server should listen. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-port_Paragraph_1 ${LANG_FRENCH} "fIP port by which the embedded web server should listen. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-port_Paragraph_1 ${LANG_SPANISH} "Puerto IP por el que el servidor web integrado debería escuchar. (Por defecto: $R9)"

; HelpPage_Help_Option_httpd-trust_Paragraph_1
LangString HelpPage_Help_Option_httpd-trust_Paragraph_1 ${LANG_ENGLISH} "Trusted IP addresses that do not require authentication token by the integrated web server. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_1 ${LANG_FRENCH} "fTrusted IP addresses that do not require authentication token by the integrated web server. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_1 ${LANG_SPANISH} "Direcciones IP de confianza que no requieren distintivo de autenticación por el servidor web integrado. (Por defecto: $R9)"

; HelpPage_Help_Option_httpd-trust_Paragraph_2
LangString HelpPage_Help_Option_httpd-trust_Paragraph_2 ${LANG_ENGLISH} \
"\i ip\i0  is an IP address in dot-decimal notation (ex. $\"127.0.0.1$\") or in CIDR notation (ex. $\"127.0.0.1/32$\")\par \
\par \
\i range\i0  is an IP address range in dot-decimal notation (ex. $\"192.168.0.0 - 192.168.0.255$\" or $\"192.168.0.0 + 255$\") or in CIDR notation (ex. $\"192.168.0.0/24$\")\par \
\par \
\i hostname\i0  is the name of a host (ex. $\"itms.acme.org$\")"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_2 ${LANG_FRENCH} \
"f\i ip\i0  is an IP address in dot-decimal notation (ex. $\"127.0.0.1$\") or in CIDR notation (ex. $\"127.0.0.1/32$\")\par \
\par \
\i range\i0  is an IP address range in dot-decimal notation (ex. $\"192.168.0.0 - 192.168.0.255$\" or $\"192.168.0.0 + 255$\") or in CIDR notation (ex. $\"192.168.0.0/24$\")\par \
\par \
\i hostname\i0  is the name of a host (ex. $\"itms.acme.org$\")"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_2 ${LANG_SPANISH} \
"\i ip\i0  es una dirección IP en notación decimal con puntos (ej. $\"127.0.0.1$\") o en notación CIDR (ej. $\"127.0.0.1/32$\")\par \
\par \
\i range\i0  es un rango de direcciones IP en notación decimal con puntos (ej. $\"192.168.0.0 - 192.168.0.255$\" o $\"192.168.0.0 + 255$\") o en notación CIDR (ej. $\"192.168.0.0/24$\")\par \
\par \
\i hostname\i0  es el nombre de un \i host\i0  (ej. $\"itms.acme.org$\")"

; HelpPage_Help_Option_httpd-trust_Paragraph_3
LangString HelpPage_Help_Option_httpd-trust_Paragraph_3 ${LANG_ENGLISH} \
"Make sure that you enclose between quotation marks any value distinct to an IP address in dot-decimal notation or a name of a host. The following is an example.\par \
\par \
\tab \i /httpd-trust=$\"127.0.0.1/32,192.168.0.0 - 192.168.0.255$\"\i0 \par \
\par \
Bear in mind that \i /httpd-trust\i0  should include the hostname part of those URIs that are set up in \i /server\i0 . The following is an example.\par \
\par \
\tab \i /httpd-trust=$\"127.0.0.1/32,itms.acme.org$\"\i0 \par \
\tab \i /server=http://itms.acme.org/glpi/plugins/fusioninventory\i0 "
LangString HelpPage_Help_Option_httpd-trust_Paragraph_3 ${LANG_FRENCH} \
"fMake sure that you enclose between quotation marks any value distinct to an IP address in dot-decimal notation or a name of a host. The following is an example.\par \
\par \
\tab \i /httpd-trust=$\"127.0.0.1/32,192.168.0.0 - 192.168.0.255$\"\i0 \par \
\par \
Bear in mind that \i /httpd-trust\i0  should include the hostname part of those URIs that are set up in \i /server\i0 . The following is an example.\par \
\par \
\tab \i /httpd-trust=$\"127.0.0.1/32,itms.acme.org$\"\i0 \par \
\tab \i /server=http://itms.acme.org/glpi/plugins/fusioninventory\i0 "
LangString HelpPage_Help_Option_httpd-trust_Paragraph_3 ${LANG_SPANISH} \
"Asegúrese de que encierra entre comillas cualquier valor distinto de una dirección IP con notación decimal con puntos o un nombre de un \i host\i0 . Lo siguiente es un ejemplo.\par \
\par \
\tab \i /httpd-trust=$\"127.0.0.1/32,192.168.0.0 - 192.168.0.255$\"\i0 \par \
\par \
Tenga en cuenta que \i /httpd-trust\i0  debería incluir la parte \i hostname\i0  de aquellas URI que están establecidas en \i /server\i0 . Lo siguiente es un ejemplo.\par \
\par \
\tab \i /httpd-trust=$\"127.0.0.1/32,itms.acme.org$\"\i0 \par \
\tab \i /server=http://itms.acme.org/glpi/plugins/fusioninventory\i0 "

; HelpPage_Help_Option_installdir_Paragraph_1
LangString HelpPage_Help_Option_installdir_Paragraph_1 ${LANG_ENGLISH} "Sets the installation base directory of the agent. (By default: $R9)"
LangString HelpPage_Help_Option_installdir_Paragraph_1 ${LANG_FRENCH} "fSets the installation base directory of the agent. (By default: $R9)"
LangString HelpPage_Help_Option_installdir_Paragraph_1 ${LANG_SPANISH} "Establece el directorio base de instalación del agente. (Por defecto: $R9)"

; HelpPage_Help_Option_installtasks_Paragraph_1
LangString HelpPage_Help_Option_installtasks_Paragraph_1 ${LANG_ENGLISH} "Selects the tasks to install. (By default: $R9)"
LangString HelpPage_Help_Option_installtasks_Paragraph_1 ${LANG_FRENCH} "fSelects the tasks to install. (By default: $R9)"
LangString HelpPage_Help_Option_installtasks_Paragraph_1 ${LANG_SPANISH} "Selecciona las tareas a instalar. (Por defecto: $R9)"

; HelpPage_Help_Option_installtasks_Paragraph_2
LangString HelpPage_Help_Option_installtasks_Paragraph_2 ${LANG_ENGLISH} \
"\i task\i0  can be any of the following values:\par \
\par \
\tab Deploy: Task Deploy\par \
\tab ESX: Task ESX\par \
\tab Inventory: Task Inventory\par \
\tab NetDiscovery: Task NetDiscovery\par \
\tab NetInventory: Task NetInventory\par \
\tab WakeOnLan: Task WakeOnLan\par \
\par \
There are three macros defined to simplify the mission, are the following:\par \
\par \
\tab Minimal: Inventory\par \
\tab Default: Inventory\par \
\tab Full: Deploy,ESX,Inventory,NetDiscovery,NetInventory,WakeOnLan"
LangString HelpPage_Help_Option_installtasks_Paragraph_2 ${LANG_FRENCH} \
"f\i task\i0  can be any of the following values:\par \
\par \
\tab Deploy: Task Deploy\par \
\tab ESX: Task ESX\par \
\tab Inventory: Task Inventory\par \
\tab NetDiscovery: Task NetDiscovery\par \
\tab NetInventory: Task NetInventory\par \
\tab WakeOnLan: Task WakeOnLan\par \
\par \
There are three macros defined to simplify the mission, are the following:\par \
\par \
\tab Minimal: Inventory\par \
\tab Default: Inventory\par \
\tab Full: Deploy,ESX,Inventory,NetDiscovery,NetInventory,WakeOnLan"
LangString HelpPage_Help_Option_installtasks_Paragraph_2 ${LANG_SPANISH} \
"\i task\i0  puede ser cualquiera de los siguientes valores:\par \
\par \
\tab Deploy: Tarea Deploy\par \
\tab ESX: Tarea ESX\par \
\tab Inventory: Tarea Inventory\par \
\tab NetDiscovery: Tarea NetDiscovery\par \
\tab NetInventory: Tarea NetInventory\par \
\tab WakeOnLan: Tarea WakeOnLan\par \
\par \
Existen tres macros definidas para simplificar el cometido, son las siguientes:\par \
\par \
\tab Minimal: Inventory\par \
\tab Default: Inventory\par \
\tab Full: Deploy,ESX,Inventory,NetDiscovery,NetInventory,WakeOnLan"

; HelpPage_Help_Option_installtasks_Paragraph_3
LangString HelpPage_Help_Option_installtasks_Paragraph_3 ${LANG_ENGLISH} "It should be noted that the Inventory task will be always installed and that the NetDiscovery and NetInventory tasks are inter-dependent. Nowadays 'Minimal' and 'Default' are the same configuration."
LangString HelpPage_Help_Option_installtasks_Paragraph_3 ${LANG_FRENCH} "fIt should be noted that the Inventory task will be always installed and that the NetDiscovery and NetInventory tasks are inter-dependent. Nowadays 'Minimal' and 'Default' are the same configuration."
LangString HelpPage_Help_Option_installtasks_Paragraph_3 ${LANG_SPANISH} "Es necesario notar que la tarea Inventory será siempre instalada y que las tareas NetDiscovery y NetInventory son interdependientes. A día de hoy 'Minimal' y 'Default' son la misma configuración."

; HelpPage_Help_Option_installdir_Paragraph_2
LangString HelpPage_Help_Option_installdir_Paragraph_2 ${LANG_ENGLISH} "You must indicate an absolute pathname."
LangString HelpPage_Help_Option_installdir_Paragraph_2 ${LANG_FRENCH} "fYou must indicate an absolute pathname."
LangString HelpPage_Help_Option_installdir_Paragraph_2 ${LANG_SPANISH} "Debe indicar un nombre de ruta absoluta."

; HelpPage_Help_Option_installtype_Paragraph_1
LangString HelpPage_Help_Option_installtype_Paragraph_1 ${LANG_ENGLISH} "Selects between an installation from the beginning (\i from-scratch\i0 ) or, whether you have currently an agent installed, an installation based on the current configuration (\i from-current-config\i0 ). (By default: $R9)"
LangString HelpPage_Help_Option_installtype_Paragraph_1 ${LANG_FRENCH} "fSelects between an installation from the beginning (from-scratch) or, whether you have currently an agent installed, an installation based on the current configuration (\i from-current-config\i0 ). (By default: $R9)"
LangString HelpPage_Help_Option_installtype_Paragraph_1 ${LANG_SPANISH} "Selecciona entre una instalación desde cero (\i from-scratch\i0 ) o, si tiene actualmente un agente instalado, una instalación basada en la configuración actual (\i from-current-config\i0 ). (Por defecto: $R9)"

; HelpPage_Help_Option_installtype_Paragraph_2
LangString HelpPage_Help_Option_installtype_Paragraph_2 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_installtype_Paragraph_2 ${LANG_FRENCH} "fToDo"
LangString HelpPage_Help_Option_installtype_Paragraph_2 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_local_Paragraph_1
LangString HelpPage_Help_Option_local_Paragraph_1 ${LANG_ENGLISH} "Writes the results of tasks execution into the given directory. (By default: $R9)"
LangString HelpPage_Help_Option_local_Paragraph_1 ${LANG_FRENCH} "fWrites the results of tasks execution into the given directory. (By default: $R9)"
LangString HelpPage_Help_Option_local_Paragraph_1 ${LANG_SPANISH} "Escribe los resultados de la ejecución de las tareas en el directorio indicado. (Por defecto: $R9)"

; HelpPage_Help_Option_local_Paragraph_2
LangString HelpPage_Help_Option_local_Paragraph_2 ${LANG_ENGLISH} "You must indicate an absolute pathname or an empty string ($\"$\"). If you indicate an empty string, the results of tasks execution will not be written locally."
LangString HelpPage_Help_Option_local_Paragraph_2 ${LANG_FRENCH} "fYou must indicate an absolute pathname or an empty string ($\"$\"). If you indicate an empty string, the results of tasks execution will not be written locally."
LangString HelpPage_Help_Option_local_Paragraph_2 ${LANG_SPANISH} "Debe indicar un nombre de ruta absoluta o una cadena vacia ($\"$\"). Si indica una cadena vacía, los resultados de la ejecución de las tareas no se escribirán localmente."

; HelpPage_Help_Option_local_Paragraph_3
LangString HelpPage_Help_Option_local_Paragraph_3 ${LANG_ENGLISH} "You can use this option and the option \i /server\i0  simultaneously."
LangString HelpPage_Help_Option_local_Paragraph_3 ${LANG_FRENCH} "fYou can use this option and the option \i /server\i0  simultaneously."
LangString HelpPage_Help_Option_local_Paragraph_3 ${LANG_SPANISH} "Puede emplear esta opción y la opción \i /server\i0  simultáneamente."

; HelpPage_Help_Option_logfile_Paragraph_1
LangString HelpPage_Help_Option_logfile_Paragraph_1 ${LANG_ENGLISH} "Writes log messages into the file \i filename\i0 . (By default: $R9)"
LangString HelpPage_Help_Option_logfile_Paragraph_1 ${LANG_FRENCH} "fWrite slog messages into the file \i filename\i0 . (By default: $R9)"
LangString HelpPage_Help_Option_logfile_Paragraph_1 ${LANG_SPANISH} "Escribe los mensajes de registro en el archivo \i filename\i0 . (Por defecto: $R9)"

; HelpPage_Help_Option_logfile_Paragraph_2
LangString HelpPage_Help_Option_logfile_Paragraph_2 ${LANG_ENGLISH} "You must indicate an absolute pathname in \i filename\i0 . This option comes into play only if you have also indicated \i File\i0  as a value of the option \i /logger\i0 ."
LangString HelpPage_Help_Option_logfile_Paragraph_2 ${LANG_FRENCH} "fYou must indicate an absolute pathname in \i filename\i0 . This option comes into play only if you have also indicated \i File\i0  as a value of the option \i /logger\i0 ."
LangString HelpPage_Help_Option_logfile_Paragraph_2 ${LANG_SPANISH} "Debe indicar un nombre de ruta absoluta en \i filename\i0 . Esta opción entra en juego únicamente si ha indicado también \i File\i0  como un valor de la opción \i /logger\i0 ."

; HelpPage_Help_Option_logfile-maxsize_Paragraph_1
LangString HelpPage_Help_Option_logfile-maxsize_Paragraph_1 ${LANG_ENGLISH} "Sets the maximum size of logfile (see option \i /logfile\i0 ) to \i size\i0 . (By default: $R9 MBytes)"
LangString HelpPage_Help_Option_logfile-maxsize_Paragraph_1 ${LANG_FRENCH} "fSets the maximum size of logfile (see option \i /logfile\i0 ) to \i size\i0 . (By default: $R9 MBytes)"
LangString HelpPage_Help_Option_logfile-maxsize_Paragraph_1 ${LANG_SPANISH} "Establece el tamaño máximo del fichero de registro (ver opción \i /logfile\i0) a \i size\i0 .  (Por defecto: $R9 MBytes)"

; HelpPage_Help_Option_logger_Paragraph_1
LangString HelpPage_Help_Option_logger_Paragraph_1 ${LANG_ENGLISH} "Sets the logger backends. (By default: $R9)"
LangString HelpPage_Help_Option_logger_Paragraph_1 ${LANG_FRENCH} "fSets the logger backends. (By default: $R9)"
LangString HelpPage_Help_Option_logger_Paragraph_1 ${LANG_SPANISH} "Establece los almacenes de los registros. (Por defecto: $R9)"

; HelpPage_Help_Option_logger_Paragraph_2
LangString HelpPage_Help_Option_logger_Paragraph_2 ${LANG_ENGLISH} \
"\i backend\i0  can be any of the following values:\par\
\par \
\tab  File: Sends the log messages to a file (see option \i /logfile\i0 )\par \
\tab  Stderr: Sends the log messages to the console"
LangString HelpPage_Help_Option_logger_Paragraph_2 ${LANG_FRENCH} \
"f\i backend\i0  can be any of the following values:\par\
\par \
\tab  File: Sends the log messages to a file (see option \i /logfile\i0 )\par \
\tab  Stderr: Sends the log messages to the console"
LangString HelpPage_Help_Option_logger_Paragraph_2 ${LANG_SPANISH} \
"\i backend\i0  puede ser cualquiera de los siguientes valores:\par\
\par \
\tab  File: Envía los mensajes de registro a un fichero (ver opción \i /logfile\i0 )\par \
\tab  Stderr: Envía los mensajes de registro a la consola"

; HelpPage_Help_Option_no-category_Paragraph_1
LangString HelpPage_Help_Option_no-category_Paragraph_1 ${LANG_ENGLISH} "Do not inventory the indicated categories of elements. (By default: $R9)"
LangString HelpPage_Help_Option_no-category_Paragraph_1 ${LANG_FRENCH} "fDo not inventory the indicated categories of elements. (By default: $R9)"
LangString HelpPage_Help_Option_no-category_Paragraph_1 ${LANG_SPANISH} "No realizar inventario de las categorías de elementos indicadas. (Por defecto: $R9)"

; HelpPage_Help_Option_no-category_Paragraph_2
LangString HelpPage_Help_Option_no-category_Paragraph_2 ${LANG_ENGLISH} \
"\i category\i0  can be any of the following values:\par \
\par \
\tab Environment: ToDo\par \
\tab Printer: ToDo\par \
\tab Process: ToDo\par \
\tab Software: ToDo\par \
\tab User: ToDo\par \
\par \
If you indicate an empty string ($\"$\"), all categories of elements will be inventoried."
LangString HelpPage_Help_Option_no-category_Paragraph_2 ${LANG_FRENCH} \
"f\i category\i0  can be any of the following values:\par \
\par \
\tab Environment: ToDo\par \
\tab Printer: ToDo\par \
\tab Process: ToDo\par \
\tab Software: ToDo\par \
\tab User: ToDo\par \
\par \
If you indicate an empty string ($\"$\"), all categories of elements will be inventoried."
LangString HelpPage_Help_Option_no-category_Paragraph_2 ${LANG_SPANISH} \
"\i category\i0  puede ser cualquiera de los siguientes valores:\par \
\par \
\tab Environment: Por hacer\par \
\tab Printer: Por hacer\par \
\tab Process: Por hacer\par \
\tab Software: Por hacer\par \
\tab User: Por hacer\par \
\par \
Si indica una cadena vacía ($\"$\"), todas las categorías de elementos serán inventariadas."

; HelpPage_Help_Option_no-html_Paragraph_1
LangString HelpPage_Help_Option_no-html_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \i /html\i0 . See option \i /html\i0  for more information."
LangString HelpPage_Help_Option_no-html_Paragraph_1 ${LANG_FRENCH} "fThis option is the opposite of \i /html\i0 . See option \i /html\i0  for more information."
LangString HelpPage_Help_Option_no-html_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \i /html\i0 . Vea opción \i /html\i0  para más información."

; HelpPage_Help_Option_no-httpd_Paragraph_1
LangString HelpPage_Help_Option_no-httpd_Paragraph_1 ${LANG_ENGLISH} "Disables the embedded web server. (By default: $R9)"
LangString HelpPage_Help_Option_no-httpd_Paragraph_1 ${LANG_FRENCH} "fDisables the embedded web server. (By default: $R9)"
LangString HelpPage_Help_Option_no-httpd_Paragraph_1 ${LANG_SPANISH} "Desactiva el servidor web integrado. (Por defecto: $R9)"

; HelpPage_Help_Option_no-p2p_Paragraph_1
LangString HelpPage_Help_Option_no-p2p_Paragraph_1 ${LANG_ENGLISH} "Do not use peer to peer to download files. (By default: $R9)"
LangString HelpPage_Help_Option_no-p2p_Paragraph_1 ${LANG_FRENCH} "fDo not use peer to peer to download files. (By default: $R9)"
LangString HelpPage_Help_Option_no-p2p_Paragraph_1 ${LANG_SPANISH} "No emplear \i peer to peer\i0  para descargar archivos. (Por defecto: $R9)"

; HelpPage_Help_Option_no-scan-homedirs_Paragraph_1
LangString HelpPage_Help_Option_no-scan-homedirs_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \i /scan-homedirs\i0 . See option \i /scan-homedirs\i0  for more information."
LangString HelpPage_Help_Option_no-scan-homedirs_Paragraph_1 ${LANG_FRENCH} "fThis option is the opposite of \i /scan-homedirs\i0 . See option \i /scan-homedirs\i0  for more information."
LangString HelpPage_Help_Option_no-scan-homedirs_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \i /scan-homedirs\i0 . Vea opción \i /scan-homedirs\i0  para más información."

; HelpPage_Help_Option_no-ssl-check_Paragraph_1
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_1 ${LANG_ENGLISH} "Do not check server certificate. (By default: $R9)"
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_1 ${LANG_FRENCH} "fDo not check server certificate. (By default: $R9)"
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_1 ${LANG_SPANISH} "No comprobar el certificado del servidor. (Por defecto: $R9)"

; HelpPage_Help_Option_no-ssl-check_Paragraph_2
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_2 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_2 ${LANG_FRENCH} "fToDo"
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_2 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_no-task_Paragraph_1
LangString HelpPage_Help_Option_no-task_Paragraph_1 ${LANG_ENGLISH} "Disables the given tasks. (By default: $R9)"
LangString HelpPage_Help_Option_no-task_Paragraph_1 ${LANG_FRENCH} "fDisables the given tasks. (By default: $R9)"
LangString HelpPage_Help_Option_no-task_Paragraph_1 ${LANG_SPANISH} "Desactiva las tareas indicadas. (Por defecto: $R9)"

; HelpPage_Help_Option_no-task_Paragraph_2
LangString HelpPage_Help_Option_no-task_Paragraph_2 ${LANG_ENGLISH} \
"\i task\i0  can be any of the following values:\par \
\par \
\tab Deploy: Task Deploy\par \
\tab ESX: Task ESX\par \
\tab Inventory: Task Inventory\par \
\tab NetDiscovery: Task NetDiscovery\par \
\tab NetInventory: Task NetInventory\par \
\tab WakeOnLan: Task WakeOnLan\par \
\par \
If you indicate an empty string ($\"$\"), all tasks will be executed."
LangString HelpPage_Help_Option_no-task_Paragraph_2 ${LANG_FRENCH} \
"f\i task\i0  can be any of the following values:\par \
\par \
\tab Deploy: Task Deploy\par \
\tab ESX: Task ESX\par \
\tab Inventory: Task Inventory\par \
\tab NetDiscovery: Task NetDiscovery\par \
\tab NetInventory: Task NetInventory\par \
\tab WakeOnLan: Task WakeOnLan\par \
\par \
If you indicate an empty string ($\"$\"), all tasks will be executed."
LangString HelpPage_Help_Option_no-task_Paragraph_2 ${LANG_SPANISH} \
"\i task\i0  puede ser cualquiera de los siguientes valores:\par \
\par \
\tab Deploy: Tarea Deploy\par \
\tab ESX: Tarea ESX\par \
\tab Inventory: Tarea Inventory\par \
\tab NetDiscovery: Tarea NetDiscovery\par \
\tab NetInventory: Tarea NetInventory\par \
\tab WakeOnLan: Tarea WakeOnLan\par \
\par \
Si indica una cadena vacía ($\"$\"), todas las tareas serán ejecutadas."

; HelpPage_Help_Option_p2p_Paragraph_1
LangString HelpPage_Help_Option_p2p_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \i /no-p2p\i0 . See option \i /no-p2p\i0  for more information."
LangString HelpPage_Help_Option_p2p_Paragraph_1 ${LANG_FRENCH} "fThis option is the opposite of \i /no-p2p\i0 . See option \i /no-p2p\i0  for more information."
LangString HelpPage_Help_Option_p2p_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \i /no-p2p\i0 . Vea opción \i /no-p2p\i0  para más información."

; HelpPage_Help_Option_password_Paragraph_1
LangString HelpPage_Help_Option_password_Paragraph_1 ${LANG_ENGLISH} "Uses \i password\i0  as password for server authentication. (By default: $R9)"
LangString HelpPage_Help_Option_password_Paragraph_1 ${LANG_FRENCH} "fUses \i password\i0  as password for server authentication. (By default: $R9)"
LangString HelpPage_Help_Option_password_Paragraph_1 ${LANG_SPANISH} "Emplea \i password\i0  como palabra de paso en la autenticación con el servidor. (Por defecto: $R9)"

; HelpPage_Help_Option_password_Paragraph_2
LangString HelpPage_Help_Option_password_Paragraph_2 ${LANG_ENGLISH} "This option comes into play only if you have also indicated a value for the option \i /server\i0 ."
LangString HelpPage_Help_Option_password_Paragraph_2 ${LANG_FRENCH} "fThis option comes into play only if you have also indicated a value for the option \i /server\i0 ."
LangString HelpPage_Help_Option_password_Paragraph_2 ${LANG_SPANISH} "Esta opción entra en juego únicamente si se ha indicado también un valor para la opción \i /server\i0 ."

; HelpPage_Help_Option_proxy_Paragraph_1
LangString HelpPage_Help_Option_proxy_Paragraph_1 ${LANG_ENGLISH} "Uses \i URI\i0  as HTTP/S proxy server. (By default: $R9)"
LangString HelpPage_Help_Option_proxy_Paragraph_1 ${LANG_FRENCH} "fUses. \i URI\i0  as HTTP/S proxy server. (By default: $R9)"
LangString HelpPage_Help_Option_proxy_Paragraph_1 ${LANG_SPANISH} "Emplea \i URI\i0  como servidor \i proxy\i0  HTTP/S. (Por defecto: $R9)"

; HelpPage_Help_Option_proxy_Paragraph_2
LangString HelpPage_Help_Option_proxy_Paragraph_2 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_proxy_Paragraph_2 ${LANG_FRENCH} "fToDo"
LangString HelpPage_Help_Option_proxy_Paragraph_2 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_runnow_Paragraph_1
LangString HelpPage_Help_Option_runnow_Paragraph_1 ${LANG_ENGLISH} "Launches the agent immediately after its installation. (By default: $R9)"
LangString HelpPage_Help_Option_runnow_Paragraph_1 ${LANG_FRENCH} "fLaunches the agent immediately after its installation. (By default: $R9)"
LangString HelpPage_Help_Option_runnow_Paragraph_1 ${LANG_SPANISH} "Lanza el agente inmediatamente después de su instalación. (Por defecto: $R9)"

; HelpPage_Help_Option_S_Paragraph_1
LangString HelpPage_Help_Option_S_Paragraph_1 ${LANG_ENGLISH} "Silent installation. (By default: $R9)"
LangString HelpPage_Help_Option_S_Paragraph_1 ${LANG_FRENCH} "fSilent installation. (By default: $R9)"
LangString HelpPage_Help_Option_S_Paragraph_1 ${LANG_SPANISH} "Instalación silenciosa. (Por defecto: $R9)"

; HelpPage_Help_Option_S_Paragraph_2
LangString HelpPage_Help_Option_S_Paragraph_2 ${LANG_ENGLISH} "You must accept the license in a explicit way (\i /acceptlicense\i0 ) if you perform the installation in silent mode."
LangString HelpPage_Help_Option_S_Paragraph_2 ${LANG_FRENCH} "fYou must accept the license in a explicit way (\i /acceptlicense\i0 ) if you perform the installation in silent mode."
LangString HelpPage_Help_Option_S_Paragraph_2 ${LANG_SPANISH} "Debe aceptar la licencia de modo explícito (\i /acceptlicense\i0 ) si realiza la instalación en modo silencioso."

; HelpPage_Help_Option_scan-homedirs_Paragraph_1
LangString HelpPage_Help_Option_scan-homedirs_Paragraph_1 ${LANG_ENGLISH} "Allow the agent to scan home directories for virtual machines. (By default: $R9)"
LangString HelpPage_Help_Option_scan-homedirs_Paragraph_1 ${LANG_FRENCH} "fAllow the agent to scan home directories for virtual machines. (By default: $R9)"
LangString HelpPage_Help_Option_scan-homedirs_Paragraph_1 ${LANG_SPANISH} "Permitir al agente buscar máquinas virtuales en los directorios \i home\i0 . (Por defecto: $R9)"

; HelpPage_Help_Option_server_Paragraph_1
LangString HelpPage_Help_Option_server_Paragraph_1 ${LANG_ENGLISH} "Sends results of tasks execution to given servers. (By default: $R9)"
LangString HelpPage_Help_Option_server_Paragraph_1 ${LANG_FRENCH} "fSends results of tasks execution to given servers. (By default: $R9)"
LangString HelpPage_Help_Option_server_Paragraph_1 ${LANG_SPANISH} "Envia los resultados de la ejecución de las tareas a los servidores indicados. (Por defecto: $R9)"

; HelpPage_Help_Option_server_Paragraph_2
LangString HelpPage_Help_Option_server_Paragraph_2 ${LANG_ENGLISH} "If you indicate an empty string ($\"$\"), the results of tasks execution will not be written remotely."
LangString HelpPage_Help_Option_server_Paragraph_2 ${LANG_FRENCH} "fIf you indicate an empty string ($\"$\"), the results of tasks execution will not be written remotely."
LangString HelpPage_Help_Option_server_Paragraph_2 ${LANG_SPANISH} "Si indica una cadena vacía ($\"$\"), los resultados de la ejecución de las tareas no se escribirán remotamente."

; HelpPage_Help_Option_server_Paragraph_3
LangString HelpPage_Help_Option_server_Paragraph_3 ${LANG_ENGLISH} "You can use this option and the option \i /local\i0  simultaneously."
LangString HelpPage_Help_Option_server_Paragraph_3 ${LANG_FRENCH} "fYou can use this option and the option \i /local\i0  simultaneously."
LangString HelpPage_Help_Option_server_Paragraph_3 ${LANG_SPANISH} "Puede emplear esta opción y la opción \i /local\i0  simultáneamente."

; HelpPage_Help_Option_ssl-check_Paragraph_1
LangString HelpPage_Help_Option_ssl-check_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \i /no-ssl-check\i0 . See option \i /no-ssl-check\i0  for more information."
LangString HelpPage_Help_Option_ssl-check_Paragraph_1 ${LANG_FRENCH} "fThis option is the opposite of \i /no-ssl-check\i0 . See option \i /no-ssl-check\i0  for more information."
LangString HelpPage_Help_Option_ssl-check_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \i /no-ssl-check\i0 . Vea opción \i /no-ssl-check\i0  para más información."

; HelpPage_Help_Option_tag_Paragraph_1
LangString HelpPage_Help_Option_tag_Paragraph_1 ${LANG_ENGLISH} "Marks the computer with the tag \i tag\i0  . (By default: $R9)"
LangString HelpPage_Help_Option_tag_Paragraph_1 ${LANG_FRENCH} "fMarks the computer with the tag \i tag\i0  . (By default: $R9)"
LangString HelpPage_Help_Option_tag_Paragraph_1 ${LANG_SPANISH} "Marca el ordenador con la etiqueta \i tag\i0  . (Por defecto: $R9)"

; HelpPage_Help_Option_tag_Paragraph_2
LangString HelpPage_Help_Option_tag_Paragraph_2 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_tag_Paragraph_2 ${LANG_FRENCH} "fToDo"
LangString HelpPage_Help_Option_tag_Paragraph_2 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_task-daily-modifier_Paragraph_1
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_1 ${LANG_ENGLISH} "Daily task schedule modifier. (By default: $R9 day)"
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_1 ${LANG_FRENCH} "fDaily task schedule modifier. (By default: $R9 day)"
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_1 ${LANG_SPANISH} "Modificador de planificador de tareas diario. (Por defecto: $R9 día)"

; HelpPage_Help_Option_task-daily-modifier_Paragraph_2
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_2 ${LANG_ENGLISH} "\i modifier\i0  can takes values between 1 and 30, both included."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_2 ${LANG_FRENCH} "f\i modifier\i0  can takes values between 1 and 30, both included."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_2 ${LANG_SPANISH} "\i modifier\i0  puede tomar valores entre 1 y 30, ambos incluidos."

; HelpPage_Help_Option_task-daily-modifier_Paragraph_3
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_3 ${LANG_ENGLISH} "This option comes into play only if you have also indicated \i Daily\i0  as value of the option \i /task-frequency\i0 ."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_3 ${LANG_FRENCH} "fThis option comes into play only if you have also indicated \i Daily\i0  as value of the option \i /task-frequency\i0 ."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_3 ${LANG_SPANISH} "Esta opción entra en juego únicamente si ha indicado también \i Daily\i0  como valor de la opción \i /task-frequency\i0 ."

; HelpPage_Help_Option_task-frequency_Paragraph_1
LangString HelpPage_Help_Option_task-frequency_Paragraph_1 ${LANG_ENGLISH} "Frequency for task schedule. (By default: $R9)"
LangString HelpPage_Help_Option_task-frequency_Paragraph_1 ${LANG_FRENCH} "fFrequency for task schedule. (By default: $R9)"
LangString HelpPage_Help_Option_task-frequency_Paragraph_1 ${LANG_SPANISH} "Frecuencia para el planificador de tareas. (Por defecto: $R9)"

; HelpPage_Help_Option_task-frequency_Paragraph_2
LangString HelpPage_Help_Option_task-frequency_Paragraph_2 ${LANG_ENGLISH} \
"\i frequency\i0  can be any of the following values:\par \
\par \
\tab Minute: At minute intervals (see option \i /task-minute-modifier\i0 )\par \
\tab Hourly: At hour intervals (see option \i /task-hourly-modifier\i0 )\par \
\tab Daily: At day intervals (see option \i /task-daily-modifier\i0 )"
LangString HelpPage_Help_Option_task-frequency_Paragraph_2 ${LANG_FRENCH} \
"f\i frequency\i0  can be any of the following values:\par \
\par \
\tab Minute: At minute intervals (see option \i /task-minute-modifier\i0 )\par \
\tab Hourly: At hour intervals (see option \i /task-hourly-modifier\i0 )\par \
\tab Daily: At day intervals (see option \i /task-daily-modifier\i0 )"
LangString HelpPage_Help_Option_task-frequency_Paragraph_2 ${LANG_SPANISH} \
"f\i frequency\i0  puede ser cualquiera de los siguientes valores:\par \
\par \
\tab Minute: En intervalos de minuto (ver opción \i /task-minute-modifier\i0 )\par \
\tab Hourly: En intervalos de hora (ver opción \i /task-hourly-modifier\i0 )\par \
\tab Daily: En intervalos de día (ver opción \i /task-daily-modifier\i0 )"

; HelpPage_Help_Option_task-hourly-modifier_Paragraph_1
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_1 ${LANG_ENGLISH} "Hourly task schedule modifier. (By default: $R9 hour)"
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_1 ${LANG_FRENCH} "fHourly task schedule modifier. (By default: $R9 hour)"
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_1 ${LANG_SPANISH} "Modificador de planificador de tareas horario. (Por defecto: $R9 hora)"

; HelpPage_Help_Option_task-hourly-modifier_Paragraph_2
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_2 ${LANG_ENGLISH} "\i modifier\i0  can takes values between 1 and 23, both included."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_2 ${LANG_FRENCH} "f\i modifier\i0  can takes values between 1 and 23, both included."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_2 ${LANG_SPANISH} "\i modifier\i0  puede tomar valores entre 1 y 23, ambos incluidos."

; HelpPage_Help_Option_task-hourly-modifier_Paragraph_3
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_3 ${LANG_ENGLISH} "This option comes into play only if you have also indicated \i Hourly\i0  as value of the option \i /task-frequency\i0 ."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_3 ${LANG_FRENCH} "fThis option comes into play only if you have also indicated \i Hourly\i0  as value of the option \i /task-frequency\i0 ."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_3 ${LANG_SPANISH} "Esta opción entra en juego únicamente si ha indicado también \i Hourly\i0  como valor de la opción \i /task-frequency\i0 ."

; HelpPage_Help_Option_task-minute-modifier_Paragraph_1
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_1 ${LANG_ENGLISH} "Minute task schedule modifier. (By default: $R9 minutes)"
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_1 ${LANG_FRENCH} "fMinute task schedule modifier. (By default: $R9 minutes)"
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_1 ${LANG_SPANISH} "Modificador de planificador de tareas por minutos. (Por defecto: $R9 minutos)"

; HelpPage_Help_Option_task-minute-modifier_Paragraph_2
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_2 ${LANG_ENGLISH} "\i modifier\i0  can take the following values: 15, 20 or 30."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_2 ${LANG_FRENCH} "f\i modifier\i0  can take the following values: 15, 20 or 30."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_2 ${LANG_SPANISH} "\i modifier\i0  puede tomar los siguientes valores: 15, 20 ó 30."

; HelpPage_Help_Option_task-minute-modifier_Paragraph_3
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_3 ${LANG_ENGLISH} "This option comes into play only if you have also indicated \i Minute\i0  as value of the option \i /task-frequency\i0 ."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_3 ${LANG_FRENCH} "fThis option comes into play only if you have also indicated \i Minute\i0  as value of the option \i /task-frequency\i0 ."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_3 ${LANG_SPANISH} "Esta opción entra en juego únicamente si ha indicado también \i Minute\i0  como valor de la opción \i /task-frequency\i0 ."

; HelpPage_Help_Option_timeout_Paragraph_1
LangString HelpPage_Help_Option_timeout_Paragraph_1 ${LANG_ENGLISH} "Sets the limit time to connect with the server. (By default: $R9 seconds)"
LangString HelpPage_Help_Option_timeout_Paragraph_1 ${LANG_FRENCH} "fSets the limit time to connect with the server. (By default: $R9 seconds)"
LangString HelpPage_Help_Option_timeout_Paragraph_1 ${LANG_SPANISH} "Establece el tiempo límite para conectar con el servidor. (Por defecto: $R9 segundos)"

; HelpPage_Help_Option_timeout_Paragraph_2
LangString HelpPage_Help_Option_timeout_Paragraph_2 ${LANG_ENGLISH} "This option comes into play only if you have also indicated a value for the option \i /server\i0 ."
LangString HelpPage_Help_Option_timeout_Paragraph_2 ${LANG_FRENCH} "fThis option comes into play only if you have also indicated a value for the option \i /server\i0 ."
LangString HelpPage_Help_Option_timeout_Paragraph_2 ${LANG_SPANISH} "Esta opción entra en juego únicamente si se ha indicado también un valor para la opción \i /server\i0 ."

; HelpPage_Help_Option_user_Paragraph_1
LangString HelpPage_Help_Option_user_Paragraph_1 ${LANG_ENGLISH} "Uses \i user\i0  as user for server authentication. (By default: $R9)"
LangString HelpPage_Help_Option_user_Paragraph_1 ${LANG_FRENCH} "fUses \i user\i0  as user for server authentication. (By default: $R9)"
LangString HelpPage_Help_Option_user_Paragraph_1 ${LANG_SPANISH} "Emplea \i user\i0  como usuario en la autenticación con el servidor. (Por defecto: $R9)"

; HelpPage_Help_Option_user_Paragraph_2
LangString HelpPage_Help_Option_user_Paragraph_2 ${LANG_ENGLISH} "This option comes into play only if you have also indicated a value for the option \i /server\i0 ."
LangString HelpPage_Help_Option_user_Paragraph_2 ${LANG_FRENCH} "fThis option comes into play only if you have also indicated a value for the option \i /server\i0 ."
LangString HelpPage_Help_Option_user_Paragraph_2 ${LANG_SPANISH} "Esta opción entra en juego únicamente si se ha indicado también un valor para la opción \i /server\i0 ."

; HelpPage_Help_Option_wait_Paragraph_1
LangString HelpPage_Help_Option_wait_Paragraph_1 ${LANG_ENGLISH} "Sets a delay between each target. (By default: $R9 seconds)"
LangString HelpPage_Help_Option_wait_Paragraph_1 ${LANG_FRENCH} "fSets a delay between each target. (By default: $R9 seconds)"
LangString HelpPage_Help_Option_wait_Paragraph_1 ${LANG_SPANISH} "Establece un retardo entre cada destino. (Por defecto: $R9 segundos )"

; HelpPage_Help_Option_wait_Paragraph_2
LangString HelpPage_Help_Option_wait_Paragraph_2 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_wait_Paragraph_2 ${LANG_FRENCH} "fToDo"
LangString HelpPage_Help_Option_wait_Paragraph_2 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Author
LangString HelpPage_Help_Author ${LANG_ENGLISH} "AUTHOR"
LangString HelpPage_Help_Author ${LANG_FRENCH} "fAUTHOR"
LangString HelpPage_Help_Author ${LANG_SPANISH} "AUTOR"

; HelpPage_Help_Author_Paragraph_1
LangString HelpPage_Help_Author_Paragraph_1 ${LANG_ENGLISH} "Tomás Abad <tabadgp@gmail.com>"
LangString HelpPage_Help_Author_Paragraph_1 ${LANG_FRENCH} "Tomás Abad <tabadgp@gmail.com>"
LangString HelpPage_Help_Author_Paragraph_1 ${LANG_SPANISH} "Tomás Abad <tabadgp@gmail.com>"

; HelpPage_Help_Bugs
LangString HelpPage_Help_Bugs ${LANG_ENGLISH} "REPORTING BUGS"
LangString HelpPage_Help_Bugs ${LANG_FRENCH} "fREPORTING BUGS"
LangString HelpPage_Help_Bugs ${LANG_SPANISH} "INFORME DE ERRORES"

; HelpPage_Help_Bugs_Paragraph_1
LangString HelpPage_Help_Bugs_Paragraph_1 ${LANG_ENGLISH} \
"User Mailing List: http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user\par \
Devel Mailing List: http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel\par \
Project Manager: http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer"
LangString HelpPage_Help_Bugs_Paragraph_1 ${LANG_FRENCH} \
"fUser Mailing List: http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user\par \
Devel Mailing List: http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel\par \
Project Manager: http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer"
LangString HelpPage_Help_Bugs_Paragraph_1 ${LANG_SPANISH} \
"Lista de Correo de Usuarios: http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user\par \
Lista de Correo de Desarrollo: http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel\par \
Gestor del Proyecto: http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer"

; HelpPage_Help_Copyright
LangString HelpPage_Help_Copyright ${LANG_ENGLISH} "COPYRIGHT"
LangString HelpPage_Help_Copyright ${LANG_FRENCH} "fCOPYRIGHT"
LangString HelpPage_Help_Copyright ${LANG_SPANISH} "COPYRIGHT"

; HelpPage_Help_Copyright_Paragraph_1
LangString HelpPage_Help_Copyright_Paragraph_1 ${LANG_ENGLISH} "Copyright 2012-2013 FusionInventory Team. GNU GPL version 2 or (at your option) any later version <http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html>. This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law."
LangString HelpPage_Help_Copyright_Paragraph_1 ${LANG_FRENCH} "fCopyright 2012-2013 FusionInventory Team. GNU GPL version 2 or (at your option) any later version <http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html>. This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law."
LangString HelpPage_Help_Copyright_Paragraph_1 ${LANG_SPANISH} "Copyright 2012-2013 FusionInventory Team. GNU GPL versión 2 o (en su opinión) cualquier versión posterior <http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html>. Esto es \i software\i0 libre, es libre de cambiarlo y distribuirlo. Este programa se ofrece SIN GARANTÍA ALGUNA."

; HelpPage_Help_SeeAlso
LangString HelpPage_Help_SeeAlso ${LANG_ENGLISH} "SEE ALSO"
LangString HelpPage_Help_SeeAlso ${LANG_FRENCH} "fSEE ALSO"
LangString HelpPage_Help_SeeAlso ${LANG_SPANISH} "VER ADEMÁS"

; HelpPage_Help_SeeAlso_Paragraph_1
LangString HelpPage_Help_SeeAlso_Paragraph_1 ${LANG_ENGLISH} "FusionInventory Web Site: http://www.fusioninventory.org/"
LangString HelpPage_Help_SeeAlso_Paragraph_1 ${LANG_FRENCH} "fFusionInventory Web Site: http://www.fusioninventory.org/"
LangString HelpPage_Help_SeeAlso_Paragraph_1 ${LANG_SPANISH} "Sitio Web de FusionInventory: http://www.fusioninventory.org/"

!endif
