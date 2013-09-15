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

   @package    FusionInventory Agent Installer for Microsoft Windows
   @file       .\FusionInventory Agent\Contrib\ModernUI2\Pages\HTTPServerOptionsPageLangStrings.nsh
   @author     Tomas Abad <tabadgp@gmail.com>
   @translator Emmanuel Le Normand <manu@le-normand.org> (French Translation)
   @copyright  Copyright (c) 2010-2013 FusionInventory Team
   @license    GNU GPL version 2 or (at your option) any later version
               http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link       http://www.fusioninventory.org/
   @link       http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since      2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_HTTPSERVEROPTIONSPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_HTTPSERVEROPTIONSPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; HTTPServerOptionsPage_Text
LangString HTTPServerOptionsPage_Text ${LANG_ENGLISH} "HTTP Server Options"
LangString HTTPServerOptionsPage_Text ${LANG_FRENCH} "Options du serveur HTTP"
LangString HTTPServerOptionsPage_Text ${LANG_SPANISH} "Opciones del servidor HTTP"

; HTTPServerOptionsPage_SubText
LangString HTTPServerOptionsPage_SubText ${LANG_ENGLISH} "Set embedded HTTP server options."
LangString HTTPServerOptionsPage_SubText ${LANG_FRENCH} "Paramétrage des options du serveur HTTP intégré."
LangString HTTPServerOptionsPage_SubText ${LANG_SPANISH} "Establezca las opciones del servidor HTTP integrado."

; HTTPServerOptionsPage_GroupBox1_Text
LangString HTTPServerOptionsPage_GroupBox1_Text ${LANG_ENGLISH} "Embedded HTTP Server Options"
LangString HTTPServerOptionsPage_GroupBox1_Text ${LANG_FRENCH} "Options du Serveur HTTP Intégré"
LangString HTTPServerOptionsPage_GroupBox1_Text ${LANG_SPANISH} "Opciones del Servidor HTTP Integrado"

; HTTPServerOptionsPage_Label1_Text
LangString HTTPServerOptionsPage_Label1_Text ${LANG_ENGLISH} "IP"
LangString HTTPServerOptionsPage_Label1_Text ${LANG_FRENCH} "IP"
LangString HTTPServerOptionsPage_Label1_Text ${LANG_SPANISH} "IP"

; HTTPServerOptionsPage_Label2_Text
LangString HTTPServerOptionsPage_Label2_Text ${LANG_ENGLISH} "Port"
LangString HTTPServerOptionsPage_Label2_Text ${LANG_FRENCH} "Port"
LangString HTTPServerOptionsPage_Label2_Text ${LANG_SPANISH} "Puerto"

; HTTPServerOptionsPage_Label3_Text
LangString HTTPServerOptionsPage_Label3_Text ${LANG_ENGLISH} "Trusted IPs"
LangString HTTPServerOptionsPage_Label3_Text ${LANG_FRENCH} "IPs de Confiance"
LangString HTTPServerOptionsPage_Label3_Text ${LANG_SPANISH} "IPs de Confianza"

; HTTPServerOptionsPage_CheckBox1_Text
LangString HTTPServerOptionsPage_CheckBox1_Text ${LANG_ENGLISH} "Add exception on the Windows Firewall"
LangString HTTPServerOptionsPage_CheckBox1_Text ${LANG_FRENCH} "Ajouter une exception dans le Firewall de Windows"
LangString HTTPServerOptionsPage_CheckBox1_Text ${LANG_SPANISH} "Añadir excepción al Cortafuegos de Windows"

; HTTPServerOptionsPage_CheckBox2_Text
LangString HTTPServerOptionsPage_CheckBox2_Text ${LANG_ENGLISH} "Enable embedded HTTP server"
LangString HTTPServerOptionsPage_CheckBox2_Text ${LANG_FRENCH} "Activer le serveur HTTP intégré"
LangString HTTPServerOptionsPage_CheckBox2_Text ${LANG_SPANISH} "Habilitar servidor HTTP integrado"

; HTTPServerOptionsPage_TextBox_Warning
LangString HTTPServerOptionsPage_TextBox_Warning ${LANG_ENGLISH} "The value $\"$R2$\" is not valid for the field $\"$R1$\"."
LangString HTTPServerOptionsPage_TextBox_Warning ${LANG_FRENCH} "La valeur $\"$R2$\" n'est pas valide pour le champ $\"$R1$\"."
LangString HTTPServerOptionsPage_TextBox_Warning ${LANG_SPANISH} "El valor $\"$R2$\" no es válido para el campo $\"$R1$\"."


!endif
