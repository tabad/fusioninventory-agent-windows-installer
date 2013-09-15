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
   @file       .\FusionInventory Agent\Contrib\ModernUI2\Pages\AdvancedOptionsPageLangStrings.nsh
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


!ifndef __FIAI_ADVANCEDOPTIONSPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_ADVANCEDOPTIONSPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; AdvancedOptionsPage_Text
LangString AdvancedOptionsPage_Text ${LANG_ENGLISH} "Advanced Options"
LangString AdvancedOptionsPage_Text ${LANG_FRENCH} "Options Avancées"
LangString AdvancedOptionsPage_Text ${LANG_SPANISH} "Opciones avanzadas"

; AdvancedOptionsPage_SubText
LangString AdvancedOptionsPage_SubText ${LANG_ENGLISH} "Set Advanced Options."
LangString AdvancedOptionsPage_SubText ${LANG_FRENCH} "Paramétrage des Options Avancées."
LangString AdvancedOptionsPage_SubText ${LANG_SPANISH} "Establezca las opciones avanzadas."

; AdvancedOptionsPage_Label1_Text
LangString AdvancedOptionsPage_Label1_Text ${LANG_ENGLISH} "Please, do not change the following options whether you are not totally sure what you are doing and why."
LangString AdvancedOptionsPage_Label1_Text ${LANG_FRENCH} "SVP, ne modifiez pas les options suivantes sauf si vous êtes sûr de ce que vous faites et pourquoi."
LangString AdvancedOptionsPage_Label1_Text ${LANG_SPANISH} "Por favor, no cambie las siguientes opciones si no está totalmente segurio de lo que está haciendo y por qué."

; AdvancedOptionsPage_GroupBox1_Text
LangString AdvancedOptionsPage_GroupBox1_Text ${LANG_ENGLISH} "Time Options (in seconds)"
LangString AdvancedOptionsPage_GroupBox1_Text ${LANG_FRENCH} "Options de temporisation (en secondes)"
LangString AdvancedOptionsPage_GroupBox1_Text ${LANG_SPANISH} "Opciones de Tiempo (en segundos)"

; AdvancedOptionsPage_Label2_Text
LangString AdvancedOptionsPage_Label2_Text ${LANG_ENGLISH} "Connection Time Out"
LangString AdvancedOptionsPage_Label2_Text ${LANG_FRENCH} "Limite du Temps de connexion"
LangString AdvancedOptionsPage_Label2_Text ${LANG_SPANISH} "Límite de Conexión"

; AdvancedOptionsPage_Label3_Text
LangString AdvancedOptionsPage_Label3_Text ${LANG_ENGLISH} "Delay Before the First Target"
LangString AdvancedOptionsPage_Label3_Text ${LANG_FRENCH} "Délai avant le Premier Lancement"
LangString AdvancedOptionsPage_Label3_Text ${LANG_SPANISH} "Demora Antes del Primer Destino"

; AdvancedOptionsPage_Label4_Text
LangString AdvancedOptionsPage_Label4_Text ${LANG_ENGLISH} "Task Execution Time Out"
LangString AdvancedOptionsPage_Label4_Text ${LANG_FRENCH} "Temps maxi de l'Exécution de la Tâche"
LangString AdvancedOptionsPage_Label4_Text ${LANG_SPANISH} "Límite de Ejecución de una Tarea"

; AdvancedOptionsPage_GroupBox2_Text
LangString AdvancedOptionsPage_GroupBox2_Text ${LANG_ENGLISH} "Other Options"
LangString AdvancedOptionsPage_GroupBox2_Text ${LANG_FRENCH} "Autres Options"
LangString AdvancedOptionsPage_GroupBox2_Text ${LANG_SPANISH} "Otras Opciones"

; AdvancedOptionsPage_CheckBox1_Text
LangString AdvancedOptionsPage_CheckBox1_Text ${LANG_ENGLISH} "No P2P"
LangString AdvancedOptionsPage_CheckBox1_Text ${LANG_FRENCH} "P2P désactivé"
LangString AdvancedOptionsPage_CheckBox1_Text ${LANG_SPANISH} "No P2P"

; AdvancedOptionsPage_Label5_Text
LangString AdvancedOptionsPage_Label5_Text ${LANG_ENGLISH} "Omit These Tasks"
LangString AdvancedOptionsPage_Label5_Text ${LANG_FRENCH} "Omettre ces Tâches"
LangString AdvancedOptionsPage_Label5_Text ${LANG_SPANISH} "Omitir Estas Tareas"

; AdvancedOptionsPage_Label6_Text
LangString AdvancedOptionsPage_Label6_Text ${LANG_ENGLISH} "(list separated by commas)"
LangString AdvancedOptionsPage_Label6_Text ${LANG_FRENCH} "(Liste séparée par des virgules)"
LangString AdvancedOptionsPage_Label6_Text ${LANG_SPANISH} "(lista separada por comas)"

; AdvancedOptionsPage_Label7_Text
LangString AdvancedOptionsPage_Label7_Text ${LANG_ENGLISH} "Omit These Categories"
LangString AdvancedOptionsPage_Label7_Text ${LANG_FRENCH} "Omettre ces Catégories"
LangString AdvancedOptionsPage_Label7_Text ${LANG_SPANISH} "Omitir Estas Categorías"

; AdvancedOptionsPage_Label8_Text
LangString AdvancedOptionsPage_Label8_Text ${LANG_ENGLISH} "(list separated by commas)"
LangString AdvancedOptionsPage_Label8_Text ${LANG_FRENCH} "(Liste séparée par des virgules)"
LangString AdvancedOptionsPage_Label8_Text ${LANG_SPANISH} "(lista separada por comas)"

; AdvancedOptionsPage_TextBox_Warning
LangString AdvancedOptionsPage_TextBox_Warning ${LANG_ENGLISH} "The value $\"$R2$\" is not valid for the field $\"$R1$\"."
LangString AdvancedOptionsPage_TextBox_Warning ${LANG_FRENCH} "La valeur $\"$R2$\" n'est pas valide pour le champ $\"$R1$\"."
LangString AdvancedOptionsPage_TextBox_Warning ${LANG_SPANISH} "El valor $\"$R2$\" no es válido para el campo $\"$R1$\"."


!endif
