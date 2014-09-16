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
   @file       .\FusionInventory Agent\Contrib\ModernUI2\Pages\MiscelaneousOptionsPageLangStrings.nsh
   @author     Manuel J. Garrido <manuel.garrido@gmail.com>
   @translator Emmanuel Le Normand <manu@le-normand.org> (French Translation)
   @copyright  Copyright (c) 2010-2013 FusionInventory Team
   @license    GNU GPL version 2 or (at your option) any later version
               http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link       http://www.fusioninventory.org/
   @link       http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since      2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_MISCELANEOUSOPTIONSPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_MISCELANEOUSOPTIONSPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; MiscelaneousOptionsPage_Text
LangString MiscelaneousOptionsPage_Text ${LANG_ENGLISH} "Miscelaneous Options"
LangString MiscelaneousOptionsPage_Text ${LANG_FRENCH} "Options Diverses"
LangString MiscelaneousOptionsPage_Text ${LANG_SPANISH} "Miscelánea de opciones"

; MiscelaneousOptionsPage_SubText
LangString MiscelaneousOptionsPage_SubText ${LANG_ENGLISH} "Set preferences about miscelaneous options."
LangString MiscelaneousOptionsPage_SubText ${LANG_FRENCH} "Paramétrage des préférences sur les options diverses."
LangString MiscelaneousOptionsPage_SubText ${LANG_SPANISH} "Establezca sus preferencias sobre opciones diversas."

; MiscelaneousOptionsPage_GroupBox1_Text
LangString MiscelaneousOptionsPage_GroupBox1_Text ${LANG_ENGLISH} "Miscelaneous Options"
LangString MiscelaneousOptionsPage_GroupBox1_Text ${LANG_FRENCH} "Options Diverses"
LangString MiscelaneousOptionsPage_GroupBox1_Text ${LANG_SPANISH} "Miscelánea de Opciones"

; MiscelaneousOptionsPage_CheckBox1_Text
LangString MiscelaneousOptionsPage_CheckBox1_Text ${LANG_ENGLISH} "Create Start Menu for all users"
LangString MiscelaneousOptionsPage_CheckBox1_Text ${LANG_FRENCH} "Créer un raccourcis dans le menu de tous les utilisateurs"
LangString MiscelaneousOptionsPage_CheckBox1_Text ${LANG_SPANISH} "Crear Menú de Inicio para todos los usuarios"

; MiscelaneousOptionsPage_CheckBox2_Text
LangString MiscelaneousOptionsPage_CheckBox2_Text ${LANG_ENGLISH} "Launch an inventory immediately after installation"
LangString MiscelaneousOptionsPage_CheckBox2_Text ${LANG_FRENCH} "Lancer un inventaire immédiatement après l'installation"
LangString MiscelaneousOptionsPage_CheckBox2_Text ${LANG_SPANISH} "Lanzar un inventario inmediatamente después de la instalación"

; MiscelaneousOptionsPage_CheckBox3_Text
LangString MiscelaneousOptionsPage_CheckBox3_Text ${LANG_ENGLISH} "Save inventory as HTML (only for local target)"
LangString MiscelaneousOptionsPage_CheckBox3_Text ${LANG_FRENCH} "Sauvegarder l'inventaire en HTML (seulement pour Mode Locale)"
LangString MiscelaneousOptionsPage_CheckBox3_Text ${LANG_SPANISH} "Grabar inventario como HTML (sólo para destino local)"

; MiscelaneousOptionsPage_CheckBox4_Text
LangString MiscelaneousOptionsPage_CheckBox4_Text ${LANG_ENGLISH} "Scan home directory for virtual machines"
LangString MiscelaneousOptionsPage_CheckBox4_Text ${LANG_FRENCH} "Rechercher les machines virtuelles dans les dossiers personnels"
LangString MiscelaneousOptionsPage_CheckBox4_Text ${LANG_SPANISH} "Buscar máquinas virtuales en el directorio personal"

; MiscelaneousOptionsPage_CheckBox5_Text
LangString MiscelaneousOptionsPage_CheckBox5_Text ${LANG_ENGLISH} "Scan user profiles for software"
LangString MiscelaneousOptionsPage_CheckBox5_Text ${LANG_FRENCH} "Recherche de logiciels dans les profils utilisateurs"
LangString MiscelaneousOptionsPage_CheckBox5_Text ${LANG_SPANISH} "Buscar software en perfiles de usuario"

; MiscelaneousOptionsPage_Label1_Text
LangString MiscelaneousOptionsPage_Label1_Text ${LANG_ENGLISH} "Tag"
LangString MiscelaneousOptionsPage_Label1_Text ${LANG_FRENCH} "Tag"
LangString MiscelaneousOptionsPage_Label1_Text ${LANG_SPANISH} "Etiqueta"

; MiscelaneousOptionsPage_TextBox_Warning
LangString MiscelaneousOptionsPage_TextBox_Warning ${LANG_ENGLISH} "The value $\"$R2$\" is not valid for the field $\"$R1$\"."
LangString MiscelaneousOptionsPage_TextBox_Warning ${LANG_FRENCH} "La valeur $\"$R2$\" n'est pas valide pour le champ $\"$R1$\"."
LangString MiscelaneousOptionsPage_TextBox_Warning ${LANG_SPANISH} "El valor $\"$R2$\" no es válido para el campo $\"$R1$\"."


!endif
