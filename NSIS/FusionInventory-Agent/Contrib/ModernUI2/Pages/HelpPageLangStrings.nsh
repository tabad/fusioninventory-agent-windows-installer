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
   @file       .\FusionInventory Agent\Contrib\ModernUI2\Pages\HelpPageLangStrings.nsh
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


!ifndef __FIAI_HELPPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_HELPPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; HelpPage_Text_Help
LangString HelpPage_Text_Help ${LANG_ENGLISH} "Help"
LangString HelpPage_Text_Help ${LANG_FRENCH} "Aide"
LangString HelpPage_Text_Help ${LANG_SPANISH} "Ayuda"

; HelpPage_Text_SyntaxError
LangString HelpPage_Text_SyntaxError ${LANG_ENGLISH} "Syntax Error"
LangString HelpPage_Text_SyntaxError ${LANG_FRENCH} "Erreur de Syntaxe"
LangString HelpPage_Text_SyntaxError ${LANG_SPANISH} "Error de Sintaxis"

; HelpPage_SubText
LangString HelpPage_SubText ${LANG_ENGLISH} "Command Line Help"
LangString HelpPage_SubText ${LANG_FRENCH} "Aide pour la ligne de commande"
LangString HelpPage_SubText ${LANG_SPANISH} "Ayuda de la línea de comandos"

; HelpPage_Label1_Text
LangString HelpPage_Label1_Text ${LANG_ENGLISH} "Press Page Down to see the rest of the help."
LangString HelpPage_Label1_Text ${LANG_FRENCH} "Utilisez la touche Page Suivante pour voir la suite de l'aide."
LangString HelpPage_Label1_Text ${LANG_SPANISH} "Presione Avanzar Página para ver el resto de la ayuda."

; HelpPage_Botton1_Text
LangString HelpPage_Button1_Text ${LANG_ENGLISH} "&Print"
LangString HelpPage_Button1_Text ${LANG_FRENCH} "&Imprimer"
LangString HelpPage_Button1_Text ${LANG_SPANISH} "&Imprimir"

; HelpPage_CancelButton_Text
LangString HelpPage_CancelButton_Text ${LANG_ENGLISH} "&Finish"
LangString HelpPage_CancelButton_Text ${LANG_FRENCH} "&Fermer"
LangString HelpPage_CancelButton_Text ${LANG_SPANISH} "&Terminar"

; HelpPage_Help_Name
LangString HelpPage_Help_Name ${LANG_ENGLISH} "NAME"
LangString HelpPage_Help_Name ${LANG_FRENCH} "NOM"
LangString HelpPage_Help_Name ${LANG_SPANISH} "NOMBRE"

; HelpPage_Help_Synopsis
LangString HelpPage_Help_Synopsis ${LANG_ENGLISH} "SYNOPSIS"
LangString HelpPage_Help_Synopsis ${LANG_FRENCH} "SYNOPSIS"
LangString HelpPage_Help_Synopsis ${LANG_SPANISH} "SINOPSIS"

; HelpPage_Help_Description
LangString HelpPage_Help_Description ${LANG_ENGLISH} "DESCRIPTION"
LangString HelpPage_Help_Description ${LANG_FRENCH} "DESCRIPTION"
LangString HelpPage_Help_Description ${LANG_SPANISH} "DESCRIPCIÓN"

; HelpPage_Help_Description_Paragraph_1
LangString HelpPage_Help_Description_Paragraph_1 ${LANG_ENGLISH} "\b ${PRODUCT_INSTALLER}\b0  installs ${PRODUCT_NAME} ${PRODUCT_VERSION} in your Microsoft Windows operative system."
LangString HelpPage_Help_Description_Paragraph_1 ${LANG_FRENCH} "\b ${PRODUCT_INSTALLER}\b0  installe ${PRODUCT_NAME} ${PRODUCT_VERSION} sur votre système d'exploitation Microsoft Windows."
LangString HelpPage_Help_Description_Paragraph_1 ${LANG_SPANISH} "\b ${PRODUCT_INSTALLER}\b0  instala ${PRODUCT_NAME} ${PRODUCT_VERSION} en su sistema operativo Microsoft Windows."

; HelpPage_Help_Description_Paragraph_2
LangString HelpPage_Help_Description_Paragraph_2 ${LANG_ENGLISH} "\b ${PRODUCT_INSTALLER}\b0  has two types of installation; the \b from-scratch\b0  type, that allows to perform an installation of ${PRODUCT_NAME} from the beginning, based on the options' default values (see below), and the \b from-current-config\b0  type, that allows to perform an installation based on the options values of the ${PRODUCT_NAME} previously installed on the system, whether it exists (see \b /installtype\b0 ). (Bear in mind that, with independence of the type of installation you choose, any existing release of ${PRODUCT_NAME} will be uninstalled automatically immediately before installing ${PRODUCT_NAME} ${PRODUCT_VERSION})"
LangString HelpPage_Help_Description_Paragraph_2 ${LANG_FRENCH} "\b ${PRODUCT_INSTALLER}\b0  a deux type d'installation; le type \b from-scratch\b0 , Cela permet une installation de ${PRODUCT_NAME} à partir de zéro, avec des options fixées par défaut (voir ci-dessous), et le type \b from-current-config\b0 , qui fera une installation avec les options paramétrées suivant les valeurs actuellement utilisées par le ${PRODUCT_NAME} précédemment installé sur le système (voir \b /installtype\b0 ). (Gardez à l'esprit que quelque soit le type d'installation choisi, toute ancienne version de ${PRODUCT_NAME} sera désinstallée automatiquement juste après l'installation de ${PRODUCT_NAME} ${PRODUCT_VERSION})"
LangString HelpPage_Help_Description_Paragraph_2 ${LANG_SPANISH} "\b ${PRODUCT_INSTALLER}\b0  dispone de dos tipos de instalación; el tipo \b from-scratch\b0 , que permite realizar una instalación de ${PRODUCT_NAME} desde cero, basada en los valores por defecto de las opciones (ver abajo), y el tipo \b from-current-config\b0 , que permite realizar una instalación basada en el valor de las opciones del ${PRODUCT_NAME} previamente instalado en el sistema, si existe (ver \b /installtype\b0 ). (Tenga en cuenta que, con independencia del tipo de instalación que elija, cualquier versión existente de ${PRODUCT_NAME} será desinstalada automáticamente inmediatamente antes de instalar ${PRODUCT_NAME} ${PRODUCT_VERSION})"

; HelpPage_Help_Description_Paragraph_3
LangString HelpPage_Help_Description_Paragraph_3 ${LANG_ENGLISH} "\b ${PRODUCT_INSTALLER}\b0  also has two modes of installation; the \i silent mode\i0  (see \b /S\b0 ), that allows to perform the installation of ${PRODUCT_NAME} in a non-interactive or unattended way, and the \i visual mode\i0 , that allows to perform the installation of ${PRODUCT_NAME} in a graphical and interactive way."
LangString HelpPage_Help_Description_Paragraph_3 ${LANG_FRENCH} "\b ${PRODUCT_INSTALLER}\b0  a aussi deux modes d'installation; Le \i mode silencieux \i0  (voir \b /S\b0 ), qui lancera l'installation de ${PRODUCT_NAME} sans interaction ou en mode autonome,  et le \i mode visuel\i0 , qui permet de faire une installation de ${PRODUCT_NAME} via une interface graphique et interactive."
LangString HelpPage_Help_Description_Paragraph_3 ${LANG_SPANISH} "\b ${PRODUCT_INSTALLER}\b0  dispone también de dos modos de instalación; el \i modo silencioso\i0  (ver \b /S\b0 ), que permite realizar la instalación de ${PRODUCT_NAME} de un modo no-interactivo o desatendido, y el \i modo visual\i0 , que permite realizar la instalación de ${PRODUCT_NAME} de un modo gráfico e interactivo."

; HelpPage_Help_Description_Paragraph_4
LangString HelpPage_Help_Description_Paragraph_4 ${LANG_ENGLISH} "\b ${PRODUCT_INSTALLER}\b0  is provided with a series of options (see below) that allows to adapt the installation to practically any environment or need. To use these options properly it is essential to know the order in which values are taken into account. That order is as follows (the higher the number, the greater the priority).\par\
\par\
\tab 0: Default values\par\
\tab 1: Values from the current ${PRODUCT_NAME} (\b from-current-config\b0  installation type only)\par\
\tab 2: Values from the command line\par\
\tab 3: Values from graphic user interface (\i graphic mode\i0  installation only)\par"
LangString HelpPage_Help_Description_Paragraph_4 ${LANG_FRENCH} "\b ${PRODUCT_INSTALLER}\b0  est fourni avec une série d'option (voir ci-dessous) d'installation qui répondent à pratiquement tous les besoins ou tous les environnements. Pour utiliser correctement ces options, il est essentiel de connaître l'ordre dans lequel elles sont prises en compte. Cet ordre est comme suis (un nombre élevé, une priorité importante).\par\
\par\
\tab 0: Valeurs par défaut\par\
\tab 1: Valeurs depuis la configuration de ${PRODUCT_NAME} (pour Installation type \b from-current-config\b0)\par\
\tab 2: Valeurs depuis la ligne de commande\par\
\tab 3: Valeurs depuis l'interface graphique (pour installation type \i graphic mode\i0)\par"
LangString HelpPage_Help_Description_Paragraph_4 ${LANG_SPANISH} "\b ${PRODUCT_INSTALLER}\b0  cuenta con una serie de opciones (ver abajo) que permite adaptar la instalación a prácticamente cualquier entorno o necesidad. Para emplear estas opciones adecuadamente es esencial conocer el orden en que los valores son tomados en cuenta. Ese orden es el siguiente (a mayor número, mayor prioridad).\par\
\par\
\tab 0: Valores por defecto\par\
\tab 1: Valores del actual ${PRODUCT_NAME} (solo en instalaciones de tipo \b from-current-config\b0 )\par\
\tab 2: Valores de la línea de comandos\par\
\tab 3: Valores de la interfaz gráfica de usuario (solo en instalaciones en \i modo gráfico\i0 )\par"

; HelpPage_Help_Description_Paragraph_5
LangString HelpPage_Help_Description_Paragraph_5 ${LANG_ENGLISH} "You should bear in mind the following when using the command line:"
LangString HelpPage_Help_Description_Paragraph_5 ${LANG_FRENCH} "Garder à l'esprit les éléments suivants lorsque vous utilisez la ligne de commande:"
LangString HelpPage_Help_Description_Paragraph_5 ${LANG_SPANISH} "Debería tener en cuenta lo siguiente cuando use la línea de comandos:"

; HelpPage_Help_Description_Paragraph_6
LangString HelpPage_Help_Description_Paragraph_6 ${LANG_ENGLISH} "\
* There are two types of options; those that act as a switch (\i /option\i0 ), and those that have a value (\i /option=value\i0 ).\par\par\
* The name of the options is case sensitive (\i /html\i0  is not the same that \i /HTML\i0 ).\par\par\
* The value of the options, unless otherwise specified, is not case sensitive (\i /local=C:\\Temp\i0  is the same that \i /local=c:\\temp\i0 ).\par\par\
* In the options that have a value,\par\par\
\tab - there should be no separation around the equal sign (\i /local = c:\\temp\i0  is incorrect).\par\par\
\tab - if the value contains a space or the (/) character, should go between single (') or double ($\") quotes (\i /local='C:\\FusionInventory Agent'\i0 ).\par\par\
\tab - if you want to set a empty value, you must indicate a empty string (\i /local=''\i0 ).\par"
LangString HelpPage_Help_Description_Paragraph_6 ${LANG_FRENCH} "\
* Il y a deux types d'options; celle qui active une option (\i /option\i0 ), et celle fixe une valeur à une option (\i /option=valeur\i0 ).\par\par\
* Le nom de ces options est sensible à la casse (\i /html\i0  n'est pas identique à \i /HTML\i0 ).\par\par\
* La valeur de ces options, sauf indication contraire, n'est pas sensible à la casse (\i /local=C:\\Temp\i0  est identique à \i /local=c:\\temp\i0 ).\par\par\
* Pour les options avec valeur,\par\par\
\tab - Il ne faut pas d'espace autour du signe égal (\i /local = c:\\temp\i0  est incorrect).\par\par\
\tab - Si la valeur contient un espace ou le caractère (/), elle doit être entre simple (') or double ($\") quotes (\i /local='C:\\FusionInventory Agent'\i0 ).\par\par\
\tab - Si vous voulez mettre une valeur nulle, vous devez la positionner entre deux quotes (\i /local=''\i0 ).\par"
LangString HelpPage_Help_Description_Paragraph_6 ${LANG_SPANISH} "\
* Existen dos tipos de opciones; aquellas que actuan como un conmutador (\i /opción\i0 ), y aquellas que tienen un valor (\i /opción=valor\i0 ).\par\par\
* El nombre de las opciones es sensible a mayúsculas y minúsculas (\i /html\i0  no es lo mismo que \i /HTML\i0 ).\par\par\
* El valor de las opciones, a menos que se indique lo contrario, no es sensible a mayúsculas y minúsculas (\i /local=C:\\Temp\i0  es lo mismo que \i /local=c:\\temp\i0 ).\par\par\
* En las opciones que tienen un valor,\par\par\
\tab - no debería haber ninguna separación alrededor del signo igual (\i /local = c:\\temp\i0  es incorrecto).\par\par\
\tab - si el valor contiene un espacio o el carácter (/), debería ir entre comillas simples (') o dobles ($\") (\i /local='C:\\FusionInventory Agent'\i0 ).\par\par\
\tab - si quiere establecer un valor vacío, debe indicar una cadena vacía (\i /local=''\i0 ).\par"

; HelpPage_Help_Description_Paragraph_7
LangString HelpPage_Help_Description_Paragraph_7 ${LANG_ENGLISH} "These are the command line options available:"
LangString HelpPage_Help_Description_Paragraph_7 ${LANG_FRENCH} "Voici les options en ligne de commande disponibles:"
LangString HelpPage_Help_Description_Paragraph_7 ${LANG_SPANISH} "Estas son las opciones disponibles de la línea de comandos:"

; HelpPage_Help_Yes
LangString HelpPage_Help_Yes ${LANG_ENGLISH} "Yes"
LangString HelpPage_Help_Yes ${LANG_FRENCH} "Oui"
LangString HelpPage_Help_Yes ${LANG_SPANISH} "Sí"

; HelpPage_Help_No
LangString HelpPage_Help_No ${LANG_ENGLISH} "No"
LangString HelpPage_Help_No ${LANG_FRENCH} "Non"
LangString HelpPage_Help_No ${LANG_SPANISH} "No"

; HelpPage_Help_Option
LangString HelpPage_Help_Option ${LANG_ENGLISH} "Option"
LangString HelpPage_Help_Option ${LANG_FRENCH} "Option"
LangString HelpPage_Help_Option ${LANG_SPANISH} "Opción"

; HelpPage_Help_Option_acceptlicense_Paragraph_1
LangString HelpPage_Help_Option_acceptlicense_Paragraph_1 ${LANG_ENGLISH} "You accept and acknowledge that you have read, and understood, the terms and conditions of ${PRODUCT_NAME} ${PRODUCT_VERSION} license. (By default: $R9)"
LangString HelpPage_Help_Option_acceptlicense_Paragraph_1 ${LANG_FRENCH} "Vous acceptez, et reconnaissez avoir lu et compris, les termes et conditions de la licence pour ${PRODUCT_NAME} ${PRODUCT_VERSION}. (Par défaut: $R9)"
LangString HelpPage_Help_Option_acceptlicense_Paragraph_1 ${LANG_SPANISH} "Acepta y reconoce que ha leído y entendido los términos y condiciones de la licencia de ${PRODUCT_NAME} ${PRODUCT_VERSION}. (Por defecto: $R9)"

; HelpPage_Help_Option_acceptlicense_Paragraph_2
LangString HelpPage_Help_Option_acceptlicense_Paragraph_2 ${LANG_ENGLISH} "You must use this option if you perform the installation in silent mode (see \b /S\b0 )."
LangString HelpPage_Help_Option_acceptlicense_Paragraph_2 ${LANG_FRENCH} " Vous devez utiliser cette option si vous voulez une installation en mode silencieux (voir \b /S\b0 )."
LangString HelpPage_Help_Option_acceptlicense_Paragraph_2 ${LANG_SPANISH} "Debe usar esta opción si realiza la instalación en modo silencioso (ver \b /S\b0 )."

; HelpPage_Help_Option_acceptlicense_Paragraph_3
LangString HelpPage_Help_Option_acceptlicense_Paragraph_3 ${LANG_ENGLISH} "If you indicate this option on the command line, but not the \b /S\b0  option, the \i visual mode\i0  installation will omit any question about the license."
LangString HelpPage_Help_Option_acceptlicense_Paragraph_3 ${LANG_FRENCH} "Si vous utilisez cette option en ligne de commande, mais pas l'option \b /S\b0, le  \i mode visuel\i0  d'installation se lancera sans demander la licence."
LangString HelpPage_Help_Option_acceptlicense_Paragraph_3 ${LANG_SPANISH} "Si indica esta opción en la línea de comandos, pero no la opción \b /S\b0 , la instalación en \i modo visual\i0  omitirá cualquier pregunta acerca de la licencia."

; HelpPage_Help_Option_add-firewall-exception_Paragraph_1
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_1 ${LANG_ENGLISH} "Adds ${PRODUCT_NAME} to the Windows Firewall exception list. (By default: $R9)"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_1 ${LANG_FRENCH} "Ajoute ${PRODUCT_NAME} dans la liste des exceptions du Firewall Windows. (Par défaut: $R9)"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_1 ${LANG_SPANISH} "Añade ${PRODUCT_NAME} a la lista de excepciones del \i Firewall\i0  de Windows. (Por defecto: $R9)"

; HelpPage_Help_Option_add-firewall-exception_Paragraph_2
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_2 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_2 ${LANG_FRENCH} "À faire"
LangString HelpPage_Help_Option_add-firewall-exception_Paragraph_2 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_collect-timeout_Paragraph_1
LangString HelpPage_Help_Option_collect-timeout_Paragraph_1 ${LANG_ENGLISH} "Timeout for task \b Inventory\b0  modules execution. (By default: $R9 seconds)"
LangString HelpPage_Help_Option_collect-timeout_Paragraph_1 ${LANG_FRENCH} "Temps maximum pour exécuter les modules de la tâche  \b Inventory\b0. (Par défaut: $R9 secondes)"
LangString HelpPage_Help_Option_collect-timeout_Paragraph_1 ${LANG_SPANISH} "Tiempo límite para la ejecución de los módulos de la tarea \b Inventory\b0 . (Por defecto: $R9 segundos)"

; HelpPage_Help_Option_ca-cert-dir_Paragraph_1
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_1 ${LANG_ENGLISH} "Absolute path to the standard certificate directory of certificate authorities (CA). (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_1 ${LANG_FRENCH} "Chemin absolu pour le dossier contenant les certificats standards autorisés (CA). (Par défaut: $R9)"
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_1 ${LANG_SPANISH} "Ruta absoluta del directorio de certificados estándar de autoridades de certificación (CA). (Por defecto: $R9)"

; HelpPage_Help_Option_ca-cert-dir_Paragraph_2
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_2 ${LANG_ENGLISH} "The use of this option is incompatible with the use of the \b /ca-cert-file\b0  option. The \b /ca-cert-dir\b0  and \b /ca-cert-file\b0  options are mutually exclusive."
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_2 ${LANG_FRENCH} "L'utilisation de cette option est incompatible avec l'utilisation de l'option \b /ca-cert-file\b0. Les options \b /ca-cert-dir\b0  et \b /ca-cert-file\b0  s'excluent mutuellement."
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_2 ${LANG_SPANISH} "El uso de esta opción es incompatible con el uso de la opción \b /ca-cert-file\b0 . Las opciones \b /ca-cert-dir\b0  y \b /ca-cert-file\b0  son mutuamente excluyentes."

; HelpPage_Help_Option_ca-cert-dir_Paragraph_3
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_3 ${LANG_ENGLISH} "A \i standard certificate directory\i0  must contain the certificate files corresponding to different certificate authorities in Privacy Enhanced Mail (PEM) format, and their names must correspond to the hash value of the certificate's \i subject\i0  field, with extension \i *.0\i0 ."
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_3 ${LANG_FRENCH} "le \i dossier standard de certification\i0  doit contenir les certificats correspondants aux différentes autorités dans le format Privacy Enhanced Mail (PEM), et leurs noms doivent correspondre aux valeurs de hachages du champ \i subject\i0  du certificat, avec l'extension \i *.0\i0 ."
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_3 ${LANG_SPANISH} "Un \i directorio de certificados estándar\i0  debe contener los ficheros correspondientes a los certificados de las distintas autoridades de certificación en formato \i Privacy Enhanced Mail\i0  (PEM), y sus nombres deben corresponder al valor \i hash\i0  del campo \i subject\i0  del certificado, con extensión \i *.0\i0 ."

; HelpPage_Help_Option_ca-cert-dir_Paragraph_4
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_4 ${LANG_ENGLISH} "For example, if you want to include the certificate file \i FICert_Class1.crt\i0  in the directory \i pathname\i0 , you must calculate the hash value of the certificate's \i subject\i0  field using, for example, OpenSSL\par\
\par\
\tab C:\\OpenSSL> openssl.exe x509 -in C:\\FICert_Class1.crt -subject_hast -noout\par\
\tab b760f1ce\par\
\par and afterwards, move or copy the certificate file to the directory \i pathname\i0  with the name \i b760f1ce.0\i0 .\par\
\par\
\tab C:\\OpenSSL> move.exe C:\\FICert_Class1.crt \i pathname\i0 \\b760f1ce.0"
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_4 ${LANG_FRENCH} "Par exemple, si vous voulez inclure le fichier du certificat \i FICert_Class1.crt\i0  dans le dossier \i pathname\i0 , vous devez calculer la valeur de hachage pour le champ \i subject\i0  du certificat utilisé, par exemple, avec OpenSSL\par\
\par\
\tab C:\\OpenSSL> openssl.exe x509 -in C:\\FICert_Class1.crt -subject_hast -noout\par\
\tab b760f1ce\par\
\par et d'après le résultat, déplacez ou copiez le fichier du certificat dans le dossier \i pathname\i0  ayant comme nom \i b760f1ce.0\i0 .\par \
\par\
\tab C:\\OpenSSL> move.exe C:\\FICert_Class1.crt \i pathname\i0 \\b760f1ce.0"
LangString HelpPage_Help_Option_ca-cert-dir_Paragraph_4 ${LANG_SPANISH} "Por ejemplo, si desea incluir el fichero de certificado \i FICert_Class1.crt\i0  en el directorio \i pathname\i0 , debe calcular el valor \i hash\i0  del campo \i subject\i0  del certificado haciendo uso de, por ejemplo, OpenSSL\par\
\par\
\tab C:\\OpenSSL> openssl.exe x509 -in C:\\FICert_Class1.crt -subject_hast -noout\par\
\tab b760f1ce\par\
\par y después, mover o copiar el fichero de certificado al directorio \i pathname\i0  con el nombre \i b760f1ce.0\i0 .\par\
\par\
\tab C:\\OpenSSL> move.exe C:\\FICert_Class1.crt \i pathname\i0 \\b760f1ce.0"

; HelpPage_Help_Option_ca-cert-file_Paragraph_1
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_1 ${LANG_ENGLISH} "Full path to the certificates file of certification authorities (CA). (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_1 ${LANG_FRENCH} "Chemin complet des certificats de l'autorité de certification (CA). (Par défaut: $R9)"
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_1 ${LANG_SPANISH} "Ruta completa al fichero de certificados de autoridades de certificación (CA). (Por defecto: $R9)"

; HelpPage_Help_Option_ca-cert-file_Paragraph_2
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_2 ${LANG_ENGLISH} "The use of this option is incompatible with the use of the \b /ca-cert-dir\b0  option. The \b /ca-cert-dir\b0  and \b /ca-cert-file\b0  options are mutually exclusive."
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_2 ${LANG_FRENCH} "L'utilisation de cette option est incompatible avec l'utilisation de l'option \b /ca-cert-dir\b0. Les options \b /ca-cert-dir\b0  et \b /ca-cert-file\b0  s'excluent mutuellement."
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_2 ${LANG_SPANISH} "El uso de esta opción es incompatible con el uso de la opción \b /ca-cert-dir\b0 . Las opciones \b /ca-cert-dir\b0  y \b /ca-cert-file\b0  son mutuamente excluyentes."

; HelpPage_Help_Option_ca-cert-file_Paragraph_3
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_3 ${LANG_ENGLISH} "\i filename\i0  must have extension \i *.pem\i0  (Privacy Enhanced Mail) and can contain one or more certificates of certificate authorities. To concatenate multiple certificate files into one file you can make use, for example, of the command \i copy\i0 .\par\
\par\
\tab C:\\> copy.exe FICert_Class1.crt+FICert_Class2.crt FICerts.pem"
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_3 ${LANG_FRENCH} "\i filename\i0  doit avoir comme extension \i *.pem\i0  (Privacy Enhanced Mail) et peut contenir un ou plusieurs certificats de l'autorité de certification. Pour concaténer plusieurs fichiers de certification dans un seul fichier vous pouvez utiliser, par exemple, cette commande : \i copy\i0 .\par\
\par\
\tab C:\\> copy.exe FICert_Class1.crt+FICert_Class2.crt FICerts.pem"
LangString HelpPage_Help_Option_ca-cert-file_Paragraph_3 ${LANG_SPANISH} "\i filename\i0  debe tener extensión \i *.pem\i0  (Privacy Enhanced Mail) y puede contener uno o varios certificados de autoridades de certificación. Para concatener varios ficheros de certificado en un solo fichero puede hacer uso, por ejemplo, del comando \i copy\i0 .\par\
\par\
\tab C:\\> copy.exe FICert_Class1.crt+FICert_Class2.crt FICerts.pem"

; HelpPage_Help_Option_ca-cert-uri_Paragraph_1
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_1 ${LANG_ENGLISH} "\i URI\i0  from where to obtain the file or files of certificate of authorities (CA). (By default: $R9)"
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_1 ${LANG_FRENCH}  "\i URI\i0  permettant d'obtenir le ou les fichiers de certificats de l'autorité (CA). (Par défaut: $R9)"
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_1 ${LANG_SPANISH} "\i URI\i0  de donde obtener el archivo o archivos de autoridades de certificación (CA). (Por defecto: $R9)"

; HelpPage_Help_Option_ca-cert-uri_Paragraph_2
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_2 ${LANG_ENGLISH} "The use of this option requires the joint use of the \b /ca-cert-dir\b0  or \b /ca-cert-file\b0  options, but not both."
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_2 ${LANG_FRENCH} "Pour utiliser cette option vous devez fournir une de ces deux options \b /ca-cert-dir\b0  ou \b /ca-cert-file\b0 , mais pas les deux."
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_2 ${LANG_SPANISH} "El uso de esta opción requiere del uso conjunto de las opciones \b /ca-cert-dir\b0  o \b /ca-cert-file\b0 , pero no de ambas."

; HelpPage_Help_Option_ca-cert-uri_Paragraph_3
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_3 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_3 ${LANG_FRENCH}  "À faire"
LangString HelpPage_Help_Option_ca-cert-uri_Paragraph_3 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_debug_Paragraph_1
LangString HelpPage_Help_Option_debug_Paragraph_1 ${LANG_ENGLISH} "Sets the debug level of the agent. (By default: $R9)"
LangString HelpPage_Help_Option_debug_Paragraph_1 ${LANG_FRENCH} "Fixe le niveau de debug de l'agent. (Par défaut: $R9)"
LangString HelpPage_Help_Option_debug_Paragraph_1 ${LANG_SPANISH} "Establece el nivel de depuración del agente. (Por defecto: $R9)"

; HelpPage_Help_Option_debug_Paragraph_2
LangString HelpPage_Help_Option_debug_Paragraph_2 ${LANG_ENGLISH} \
"\i level\i0  can be any of the following values:\par\
\par\
\tab\b 0\b0 : Debug off\par\
\tab\b 1\b0 : Normal debug\par\
\tab\b 2\b0 : Full debug"
LangString HelpPage_Help_Option_debug_Paragraph_2 ${LANG_FRENCH} \
"\i level\i0  peut avoir une des valeurs suivantes:\par\
\par\
\tab\b 0\b0 : Pas de Debug\par\
\tab\b 1\b0 : Debug normal\par\
\tab\b 2\b0 : Debug complet"
LangString HelpPage_Help_Option_debug_Paragraph_2 ${LANG_SPANISH} \
"\i level\i0  puede ser cualquiera de los siguientes valores:\par\
\par\
\tab\b 0\b0 : Sin depuración\par\
\tab\b 1\b0 : Depuración normal\par\
\tab\b 2\b0 : Depuración completa"

; HelpPage_Help_Option_delaytime_Paragraph_1
LangString HelpPage_Help_Option_delaytime_Paragraph_1 ${LANG_ENGLISH} "Sets an initial delay before first contact with a remote destination (see \b /server\b0 ). This delay is calculated at random between \i limit/2\i0  and \i limit\i0  seconds. (Default: $R9 seconds)"
LangString HelpPage_Help_Option_delaytime_Paragraph_1 ${LANG_FRENCH} "Paramètre le délai pour lancer le premier contact avec le serveur (voir \b /server\b0 ). Ce délai est calculé aléatoirement entre \i limit/2\i0  et \i limit\i0  secondes. (Défaut: $R9 secondes)"
LangString HelpPage_Help_Option_delaytime_Paragraph_1 ${LANG_SPANISH} "Establece una demora inicial antes de primer contacto con un destino remoto (ver \b /server\b0 ). Esta demora se calcula al azar entre \i limit/2\i0  y \i limit\i0  segundos. (Por defecto: $R9 segundos)"

; HelpPage_Help_Option_delaytime_Paragraph_2
LangString HelpPage_Help_Option_delaytime_Paragraph_2 ${LANG_ENGLISH} "This option is ignored for remote destinations after the first contact with each one, in favor of the specific server parameter (PROLOG_FREQ)."
LangString HelpPage_Help_Option_delaytime_Paragraph_2 ${LANG_FRENCH} "Cette option est ignorée pour contacter le serveur après le premier contact selon, pour chaque serveur, leur paramètre spécifique (PROLOG_FREQ)."
LangString HelpPage_Help_Option_delaytime_Paragraph_2 ${LANG_SPANISH} "Esta opción se omite para los destinos remotos después del primer contacto con cada uno, en favor del parámetro específico del servidor (PROLOG_FREQ)."

; HelpPage_Help_Option_delaytime_Paragraph_3
LangString HelpPage_Help_Option_delaytime_Paragraph_3 ${LANG_ENGLISH} "The \b /delaytime\b0  option comes into play only if ${PRODUCT_NAME} runs in \i server mode\i0  (see \b /execmode\b0 )."
LangString HelpPage_Help_Option_delaytime_Paragraph_3 ${LANG_FRENCH} "L'option \b /delaytime\b0  est utilisée seulement si  ${PRODUCT_NAME} est lancé en \i mode serveur\i0  (voir \b /execmode\b0 )."
LangString HelpPage_Help_Option_delaytime_Paragraph_3 ${LANG_SPANISH} "La opción \b /delaytime\b0  entra en juego únicamente si ${PRODUCT_NAME} se ejecuta en \i modo servidor\i0  (ver \b /execmode\b0 )."

; HelpPage_Help_Option_dumphelp_Paragraph_1
LangString HelpPage_Help_Option_dumphelp_Paragraph_1 ${LANG_ENGLISH} "See \b /help\b0 ."
LangString HelpPage_Help_Option_dumphelp_Paragraph_1 ${LANG_FRENCH} "Voir \b /help\b0 ."
LangString HelpPage_Help_Option_dumphelp_Paragraph_1 ${LANG_SPANISH} "Ver \b /help\b0 ."

; HelpPage_Help_Option_execmode_Paragraph_1
LangString HelpPage_Help_Option_execmode_Paragraph_1 ${LANG_ENGLISH} "Sets the agent execution mode. (By default: \b $R9\b0 )"
LangString HelpPage_Help_Option_execmode_Paragraph_1 ${LANG_FRENCH} "Définit le mode d'exécution de l'agent. (Par défaut: \b $R9\b0 )"
LangString HelpPage_Help_Option_execmode_Paragraph_1 ${LANG_SPANISH} "Establece el modo de ejecución del agente. (Por defecto: \b $R9\b0 )"

; HelpPage_Help_Option_execmode_Paragraph_2
LangString HelpPage_Help_Option_execmode_Paragraph_2 ${LANG_ENGLISH} \
"\i mode\i0  can be any of the following values:\par\
\par\
\tab\b Service\b0 : The agent runs as a Windows Service (always running)\par\
\tab\b Task\b0 : The agent runs as a Windows Task (runs at intervals)\par\
\tab\b Manual\b0 : The agent doesn't run automatically (no \b Service\b0 , no \b Task\b0 )\par\
\tab\b Current\b0 : The agent runs in the same way that the agent already installed runs"
LangString HelpPage_Help_Option_execmode_Paragraph_2 ${LANG_FRENCH} \
"\i mode\i0  peut avoir une des valeurs suivantes:\par\
\par\
\tab\b Service\b0 : L'agent est lancé comme un Service Windows (toujours actif)\par\
\tab\b Task\b0 : L'agent est lancé par le gestionnaire de Tâche Windows (actif par intervalle)\par\
\tab\b Manual\b0 : L'agent n'est pas lancé automatiquement (pas de \b Service\b0 , pas de \b Task\b0 )\par\
\tab\b Current\b0 : L'agent est lancé suivant la même règle que l'agent actuellement installé"
LangString HelpPage_Help_Option_execmode_Paragraph_2 ${LANG_SPANISH} \
"\i mode\i0  puede ser cualquiera de los siguientes valores:\par\
\par\
\tab\b Service\b0 : El agente se ejecuta como un Servicio Windows (siempre en ejecución)\par\
\tab\b Task\b0 : El agente se ejecuta como una Tarea Windows (ejecución a intervalos)\par\
\tab\b Manual\b0 : El agente no se ejecuta automáticamente (ni \b Service\b0 , ni \b Task\b0 )\par\
\tab\b Current\b0 : El agente se ejecuta del mismo modo que se ejecuta el agente ya instalado"

; HelpPage_Help_Option_execmode_Paragraph_3
LangString HelpPage_Help_Option_execmode_Paragraph_3 ${LANG_ENGLISH} \
"The mode \b Service\b0  is known also as \i server mode\i0 .\par\
\par The mode \b Task\b0  is only available on Windows XP (or higher) and Windows Server 2003 (or higher) operative systems.\par\
\par In the case of an installation \b from-scratch\b0  (see \b /installtype\b0 ), the \b Current\b0  mode is a synonym of \b Service\b0 ."
LangString HelpPage_Help_Option_execmode_Paragraph_3 ${LANG_FRENCH} \
"Le mode \b Service\b0  est aussi connu comme \i mode serveur\i0 .\par\
\par Le mode \b Task\b0  est seulement disponible pour Windows XP (ou supérieur) et Windows Server 2003 (ou supérieur) .\par\
\par Dans le cas d'une installation \b from-scratch\b0  (voir \b /installtype\b0 ), le mode \b Current\b0  est synonyme de \b Service\b0 ."
LangString HelpPage_Help_Option_execmode_Paragraph_3 ${LANG_SPANISH} \
"El modo \b Service\b0  es conocido también como \i modo servidor\i0 .\par\
\par El modo \b Task\b0  solo está disponible en sistemas operativos Windows XP (o superior) y Windows Server 2003 (o superior).\par\
\par En el caso de una instalación \b from-scratch\b0  (ver \b /installtype\b0 ), el modo \b Current\b0  es un sinónimo de \b Service\b0 ."

; HelpPage_Help_Option_help_Paragraph_1
LangString HelpPage_Help_Option_help_Paragraph_1 ${LANG_ENGLISH} "This help. If the \b /help\b0  option is present, shows the help and aborts the installation."
LangString HelpPage_Help_Option_help_Paragraph_1 ${LANG_FRENCH} "Cette aide. Si l'option \b /help\b0  est présente, l'aide est montrée et l'installation interrompue."
LangString HelpPage_Help_Option_help_Paragraph_1 ${LANG_SPANISH} "Esta ayuda. Si la opción \b /help\b0  está presente, muestra la ayuda y aborta la instalación."

; HelpPage_Help_Option_help_Paragraph_2
LangString HelpPage_Help_Option_help_Paragraph_2 ${LANG_ENGLISH} "You could prefer make use of the \b /dumphelp\b0  option instead of the \b /help\b0  option to get information. The \b /dumphelp\b0  option creates a RTF file with this help, and aborts the installation."
LangString HelpPage_Help_Option_help_Paragraph_2 ${LANG_FRENCH} "Vous pourriez préférer faire usage de l'option \b /dumphelp\b0  au lieu de l'option \b /help\b0  pour avoir toutes les informations. L'option \b /dumphelp\b0  crée un fichier RTF contenant l'aide, et arrête l'installation."
LangString HelpPage_Help_Option_help_Paragraph_2 ${LANG_SPANISH} "Podría preferir hacer uso de la opción \b /dumphelp\b0  en su lugar de la opción \b /help\b0  para obtener información. La opción \b /dumphelp\b0  crea un archivo RTF con esta ayuda y aborta la instalación."

; HelpPage_Help_Option_httpd_Paragraph_1
LangString HelpPage_Help_Option_httpd_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \b /no-httpd\b0 . See \b /no-httpd\b0  for more information."
LangString HelpPage_Help_Option_httpd_Paragraph_1 ${LANG_FRENCH} "Cette option est l'opposée de \b /no-httpd\b0 . Voir \b /no-httpd\b0  pour plus d'information."
LangString HelpPage_Help_Option_httpd_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \b /no-httpd\b0 . Ver \b /no-httpd\b0  para más información."

; HelpPage_Help_Option_httpd-ip_Paragraph_1
LangString HelpPage_Help_Option_httpd-ip_Paragraph_1 ${LANG_ENGLISH} "IP address by which the embedded web server should listen. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-ip_Paragraph_1 ${LANG_FRENCH} "Adresse IP que le serveur web intégré utilisera. (Par défaut: $R9)"
LangString HelpPage_Help_Option_httpd-ip_Paragraph_1 ${LANG_SPANISH} "Dirección IP por la que el servidor web integrado debería escuchar. (Por defecto: $R9)"

; HelpPage_Help_Option_httpd-port_Paragraph_1
LangString HelpPage_Help_Option_httpd-port_Paragraph_1 ${LANG_ENGLISH} "IP port by which the embedded web server should listen. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-port_Paragraph_1 ${LANG_FRENCH} "Port IP que le serveur web intégré utilisera. (Par défaut: $R9)"
LangString HelpPage_Help_Option_httpd-port_Paragraph_1 ${LANG_SPANISH} "Puerto IP por el que el servidor web integrado debería escuchar. (Por defecto: $R9)"

; HelpPage_Help_Option_httpd-trust_Paragraph_1
LangString HelpPage_Help_Option_httpd-trust_Paragraph_1 ${LANG_ENGLISH} "Trusted IP addresses that do not require authentication token by the integrated web server. (By default: $R9)"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_1 ${LANG_FRENCH} "Adresses IP de confiance qui ne nécessite pas de jeton d'authentification par le serveur web intégré. (Par défaut: $R9)"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_1 ${LANG_SPANISH} "Direcciones IP de confianza que no requieren distintivo de autenticación por el servidor web integrado. (Por defecto: $R9)"

; HelpPage_Help_Option_httpd-trust_Paragraph_2
LangString HelpPage_Help_Option_httpd-trust_Paragraph_2 ${LANG_ENGLISH} \
"\i ip\i0  is an IP address in dot-decimal notation (ex. $\"127.0.0.1$\") or in CIDR notation (ex. $\"127.0.0.1/32$\")\par\
\par\i range\i0  is an IP address range in dot-decimal notation (ex. $\"192.168.0.0 - 192.168.0.255$\" or $\"192.168.0.0 + 255$\") or in CIDR notation (ex. $\"192.168.0.0/24$\")\par\
\par\i hostname\i0  is the name of a host (ex. $\"itms.acme.org$\")"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_2 ${LANG_FRENCH} \
"\i ip\i0  est une adresse IP en notation décimale (ex. $\"127.0.0.1$\") ou en notation CIDR (ex. $\"127.0.0.1/32$\")\par\
\par\i range\i0  est une plage d'adresses IP en notation décimale (ex. $\"192.168.0.0 - 192.168.0.255$\" ou $\"192.168.0.0 + 255$\") ou en notation CIDR (ex. $\"192.168.0.0/24$\")\par\
\par\i hostname\i0  est le nom de l'hôte (ex. $\"itms.acme.org$\")"
LangString HelpPage_Help_Option_httpd-trust_Paragraph_2 ${LANG_SPANISH} \
"\i ip\i0  es una dirección IP en notación decimal con puntos (ej. $\"127.0.0.1$\") o en notación CIDR (ej. $\"127.0.0.1/32$\")\par\
\par\i range\i0  es un rango de direcciones IP en notación decimal con puntos (ej. $\"192.168.0.0 - 192.168.0.255$\" o $\"192.168.0.0 + 255$\") o en notación CIDR (ej. $\"192.168.0.0/24$\")\par\
\par\i hostname\i0  es el nombre de un \i host\i0  (ej. $\"itms.acme.org$\")"

; HelpPage_Help_Option_httpd-trust_Paragraph_3
LangString HelpPage_Help_Option_httpd-trust_Paragraph_3 ${LANG_ENGLISH} \
"Bear in mind that \b /httpd-trust\b0  does not have to include the hostname part of those URIs that are set up in \b /server\b0  because they are tacitly included. The following is an example; both configurations are equal.\par\
\par\
\tab /httpd-trust=$\"127.0.0.1/32,itms.acme.org$\"\par\
\tab /server=$\"http://itms.acme.org/glpi/plugins/fusioninventory/$\"\par\
\par\
\tab /httpd-trust=$\"127.0.0.1/32$\"\par\
\tab /server=$\"http://itms.acme.org/glpi/plugins/fusioninventory/$\""
LangString HelpPage_Help_Option_httpd-trust_Paragraph_3 ${LANG_FRENCH} \
"Sachez que \b /httpd-trust\b0  ne doit pas forcément inclure le nom de l'hôte que vous aurez paramétré dans l'URIs de l'option \b /server\b0  parce qu'il est tacitement inclus. Regardez l'exemple suivant; Les deux configurations sont équivalentes.\par\
\par\
\tab /httpd-trust=$\"127.0.0.1/32,itms.acme.org$\"\par\
\tab /server=$\"http://itms.acme.org/glpi/plugins/fusioninventory/$\"\par\
\par\
\tab /httpd-trust=$\"127.0.0.1/32$\"\par\
\tab /server=$\"http://itms.acme.org/glpi/plugins/fusioninventory/$\""
LangString HelpPage_Help_Option_httpd-trust_Paragraph_3 ${LANG_SPANISH} \
"Tenga en cuenta que \b /httpd-trust\b0  no tiene que incluir la parte \i hostname\i0  de aquellas URI que están establecidas en \b /server\b0  porque están tácitamente incluidas. Lo siguiente es un ejemplo; ambas configuraciones son iguales.\par\
\par\
\tab /httpd-trust=$\"127.0.0.1/32,itms.acme.org$\"\par\
\tab /server=$\"http://itms.acme.org/glpi/plugins/fusioninventory/$\"\par\
\par\
\tab /httpd-trust=$\"127.0.0.1/32$\"\par\
\tab /server=$\"http://itms.acme.org/glpi/plugins/fusioninventory/$\""

; HelpPage_Help_Option_installdir_Paragraph_1
LangString HelpPage_Help_Option_installdir_Paragraph_1 ${LANG_ENGLISH} "Sets the installation base directory of the agent. (By default: $R9)"
LangString HelpPage_Help_Option_installdir_Paragraph_1 ${LANG_FRENCH} "Définit le dossier de base pour l'installation de l'agent. (Par défaut: $R9)"
LangString HelpPage_Help_Option_installdir_Paragraph_1 ${LANG_SPANISH} "Establece el directorio base de instalación del agente. (Por defecto: $R9)"

; HelpPage_Help_Option_installdir_Paragraph_2
LangString HelpPage_Help_Option_installdir_Paragraph_2 ${LANG_ENGLISH} "\i pathname\i0  must be an absolute path."
LangString HelpPage_Help_Option_installdir_Paragraph_2 ${LANG_FRENCH} "\i pathname\i0  doit être un chemin absolu."
LangString HelpPage_Help_Option_installdir_Paragraph_2 ${LANG_SPANISH} "\i pathname\i0  debe ser una ruta absoluta."

; HelpPage_Help_Option_installdir_Paragraph_3
LangString HelpPage_Help_Option_installdir_Paragraph_3 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Option_installdir_Paragraph_3 ${LANG_FRENCH} "À faire"
LangString HelpPage_Help_Option_installdir_Paragraph_3 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Option_installtasks_Paragraph_1
LangString HelpPage_Help_Option_installtasks_Paragraph_1 ${LANG_ENGLISH} "Selects the tasks to install. (By default: \b $R9\b0 )"
LangString HelpPage_Help_Option_installtasks_Paragraph_1 ${LANG_FRENCH} "Sélectionne des tâches à installer. (Par défaut: \b $R9\b0 )"
LangString HelpPage_Help_Option_installtasks_Paragraph_1 ${LANG_SPANISH} "Selecciona las tareas a instalar. (Por defecto: \b $R9\b0 )"

; HelpPage_Help_Option_installtasks_Paragraph_2
LangString HelpPage_Help_Option_installtasks_Paragraph_2 ${LANG_ENGLISH} \
"\i task\i0  can be any of the following values:\par\
\par\
\tab\b Deploy\b0 : Task Deploy\par\
\tab\b ESX\b0 : Task ESX\par\
\tab\b Inventory\b0 : Task Inventory\par\
\tab\b NetDiscovery\b0 : Task NetDiscovery\par\
\tab\b NetInventory\b0 : Task NetInventory\par\
\tab\b WakeOnLan\b0 : Task WakeOnLan\par\
\par There are three macros defined to simplify the mission, are the following:\par\
\par\
\tab\b Minimal\b0 : \b Inventory\b0\par\
\tab\b Default\b0 : \b Inventory\b0\par\
\tab\b Full\b0 : \b Deploy\b0 ,\b ESX\b0 ,\b Inventory\b0 ,\b NetDiscovery\b0 ,\b NetInventory\b0 ,\b WakeOnLan\b0"
LangString HelpPage_Help_Option_installtasks_Paragraph_2 ${LANG_FRENCH} \
"\i task\i0  peut avoir une des valeurs suivantes:\par\
\par\
\tab\b Deploy\b0 : Tâche de Déploiement\par\
\tab\b ESX\b0 : Tâche ESX\par\
\tab\b Inventory\b0 : Tâche Inventaire\par\
\tab\b NetDiscovery\b0 : Tâche NetDiscovery\par\
\tab\b NetInventory\b0 : Tâche NetInventory\par\
\tab\b WakeOnLan\b0 : Tâche WakeOnLan\par\
\par Il y a trois macros pré-définies pour simplifier l'installation :\par\
\par\
\tab\b Minimal\b0 : \b Inventory\b0\par\
\tab\b Default\b0 : \b Inventory\b0\par\
\tab\b Full\b0 : \b Deploy\b0 ,\b ESX\b0 ,\b Inventory\b0 ,\b NetDiscovery\b0 ,\b NetInventory\b0 ,\b WakeOnLan\b0"
LangString HelpPage_Help_Option_installtasks_Paragraph_2 ${LANG_SPANISH} \
"\i task\i0  puede ser cualquiera de los siguientes valores:\par\
\par\
\tab\b Deploy\b0 : Tarea Deploy\par\
\tab\b ESX\b0 : Tarea ESX\par\
\tab\b Inventory\b0 : Tarea Inventory\par\
\tab\b NetDiscovery\b0 : Tarea NetDiscovery\par\
\tab\b NetInventory\b0 : Tarea NetInventory\par\
\tab\b WakeOnLan\b0 : Tarea WakeOnLan\par\
\par Existen tres macros definidas para simplificar el cometido, son las siguientes:\par\
\par\
\tab\b Minimal\b0 : \b Inventory\b0\par\
\tab\b Default\b0 : \b Inventory\b0\par\
\tab\b Full\b0 : \b Deploy\b0 ,\b ESX\b0 ,\b Inventory\b0 ,\b NetDiscovery\b0 ,\b NetInventory\b0 ,\b WakeOnLan\b0"

; HelpPage_Help_Option_installtasks_Paragraph_3
LangString HelpPage_Help_Option_installtasks_Paragraph_3 ${LANG_ENGLISH} "It should be noted that the \b Inventory\b0  task will be always installed and that the \b NetDiscovery\b0  and \b NetInventory\b0  tasks are inter-dependent. Nowadays \b Minimal\b0  and \b Default\b0  are the same configuration."
LangString HelpPage_Help_Option_installtasks_Paragraph_3 ${LANG_FRENCH} "Il convient de noter que la tâche \b Inventory\b0  sera toujours installé et que les tâches \b NetDiscovery\b0  et \b NetInventory\b0  sont inter-dépendantes. Actuellement, \b Minimal\b0  et \b Default\b0  sont identiques."
LangString HelpPage_Help_Option_installtasks_Paragraph_3 ${LANG_SPANISH} "Es necesario notar que la tarea \b Inventory será siempre instalada y que las tareas \b NetDiscovery y \b NetInventory son interdependientes. A día de hoy \b Minimal\b0  y \b Default\b0  son la misma configuración."

; HelpPage_Help_Option_installtype_Paragraph_1
LangString HelpPage_Help_Option_installtype_Paragraph_1 ${LANG_ENGLISH} "Selects between an installation from the beginning (\b from-scratch\b0 ) or, whether the system has a previously installed agent, an installation based on the current configuration (\b from-current-config\b0 ). (By default: \b $R9\b0 )"
LangString HelpPage_Help_Option_installtype_Paragraph_1 ${LANG_FRENCH} "Sélectionne entre une installation à partir de zéro (\b from-scratch\b0 ) ou, une configuration de l'agent suivant l'installation précédente sur votre système (\b from-current-config\b0 ). (Par défaut: \b $R9\b0 )"
LangString HelpPage_Help_Option_installtype_Paragraph_1 ${LANG_SPANISH} "Selecciona entre una instalación desde cero (\b from-scratch\b0 ) o, si el sistema tiene un agente previamente instalado, una instalación basada en la configuración actual (\b from-current-config\b0 ). (Por defecto: \b $R9\b0 )"

; HelpPage_Help_Option_installtype_Paragraph_2
LangString HelpPage_Help_Option_installtype_Paragraph_2 ${LANG_ENGLISH} "The installer automatically switches from \b from-current-config\b0  to \b from-scratch\b0  whether it's not able to detect a ${PRODUCT_NAME} previously installed on the system. This behaviour makes unnecesary to have to indicate \b /installtype\b0 =\b from-scratch\b0  to perform a ${PRODUCT_NAME} installation on those systems in which it doesn't exist previously and, at the same time, facillitates the update of ${PRODUCT_NAME} on those systems in which it exists."
LangString HelpPage_Help_Option_installtype_Paragraph_2 ${LANG_FRENCH} "L'installation commutera automatiquement de \b from-current-config\b0  à \b from-scratch\b0  si la détection, sur votre système, d'une version précédente de ${PRODUCT_NAME} échoue. Ce test rend inutile de préciser \b /installtype\b0 =\b from-scratch\b0  pour installer ${PRODUCT_NAME} sur des systèmes n'ayant pas d'agent installé, tout en facilitant la mise à jour de système ayant déjà ${PRODUCT_NAME} d'installé avec une seule procédure commune."
LangString HelpPage_Help_Option_installtype_Paragraph_2 ${LANG_SPANISH} "El instalador cambia automáticamente de \b from-current-config\b0  a \b from-scratch\b0  si no es capaz de detectar un agente instalado previamente en el sistema. Este comportamiento hace innecesario tener que indicar \b /installtype\b0 =\b from-scratch\b0  para realizar una instalación de ${PRODUCT_NAME} en aquellos sistemas en los que no existe con anterioridad y, al mismo tiempo, facilita la actualización de ${PRODUCT_NAME} en aquellos sistemas en los que existe."

; HelpPage_Help_Option_local_Paragraph_1
LangString HelpPage_Help_Option_local_Paragraph_1 ${LANG_ENGLISH} "Writes the results of tasks execution into the given directory. (By default: $R9)"
LangString HelpPage_Help_Option_local_Paragraph_1 ${LANG_FRENCH} "Écrit les résultats de l'exécution des tâches dans le dossier donné. (Par défaut: $R9)"
LangString HelpPage_Help_Option_local_Paragraph_1 ${LANG_SPANISH} "Escribe los resultados de la ejecución de las tareas en el directorio indicado. (Por defecto: $R9)"

; HelpPage_Help_Option_local_Paragraph_2
LangString HelpPage_Help_Option_local_Paragraph_2 ${LANG_ENGLISH} "You must indicate an absolute pathname or an empty string ($\"$\"). If you indicate an empty string, the results of tasks execution will not be written locally."
LangString HelpPage_Help_Option_local_Paragraph_2 ${LANG_FRENCH} "Vous devez donner un chemin absolu ou une chaîne vide ($\"$\"). Si vous utilisez une chaîne vide, le résultat de l'exécution de la tâche ne pourra pas être écrit localement."
LangString HelpPage_Help_Option_local_Paragraph_2 ${LANG_SPANISH} "Debe indicar un nombre de ruta absoluta o una cadena vacia ($\"$\"). Si indica una cadena vacía, los resultados de la ejecución de las tareas no se escribirán localmente."

; HelpPage_Help_Option_local_Paragraph_3
LangString HelpPage_Help_Option_local_Paragraph_3 ${LANG_ENGLISH} "You can use the \b /local\b0  and \b /server\b0  options simultaneously."
LangString HelpPage_Help_Option_local_Paragraph_3 ${LANG_FRENCH} "Vous pouvez utiliser les options \b /local\b0  et \b /server\b0  simultanément."
LangString HelpPage_Help_Option_local_Paragraph_3 ${LANG_SPANISH} "Puede emplear las opciones \b /local\b0  y \b /server\b0  simultáneamente."

; HelpPage_Help_Option_logfile_Paragraph_1
LangString HelpPage_Help_Option_logfile_Paragraph_1 ${LANG_ENGLISH} "Writes log messages into the file \i filename\i0 . (By default: $R9)"
LangString HelpPage_Help_Option_logfile_Paragraph_1 ${LANG_FRENCH} "Écrit les messages de log dans le fichier \i filename\i0 . (Par défaut: $R9)"
LangString HelpPage_Help_Option_logfile_Paragraph_1 ${LANG_SPANISH} "Escribe los mensajes de registro en el archivo \i filename\i0 . (Por defecto: $R9)"

; HelpPage_Help_Option_logfile_Paragraph_2
LangString HelpPage_Help_Option_logfile_Paragraph_2 ${LANG_ENGLISH} "You must indicate a full path in \i filename\i0 . The \b /local\b0  option comes into play only if you have also indicated \b File\b0  as a value of the \b /logger\b0  option."
LangString HelpPage_Help_Option_logfile_Paragraph_2 ${LANG_FRENCH} "Vous devez indiquer le chemin complet dans \i filename\i0 . L'option \b /local\b0  est utilisable seulement si vous donnez aussi la valeur \b File\b0  à l'option \b /logger\b0 ."
LangString HelpPage_Help_Option_logfile_Paragraph_2 ${LANG_SPANISH} "Debe indicar una ruta completa en \i filename\i0 . The opción \b /local\b0  entra en juego únicamente si ha indicado también \b File\b0  como un valor de la opción \b /logger\b0 ."

; HelpPage_Help_Option_logfile-maxsize_Paragraph_1
LangString HelpPage_Help_Option_logfile-maxsize_Paragraph_1 ${LANG_ENGLISH} "Sets the maximum size of logfile (see \b /logfile\b0 ) to \i size\i0  . (By default: $R9 MBytes)"
LangString HelpPage_Help_Option_logfile-maxsize_Paragraph_1 ${LANG_FRENCH} "Définit la taille maximum du fichier de log (voir \b /logfile\b0 ) a \i size\i0  . (Par défaut: $R9 MBytes)"
LangString HelpPage_Help_Option_logfile-maxsize_Paragraph_1 ${LANG_SPANISH} "Establece el tamaño máximo del fichero de registro (ver \b /logfile\b0 ) a \i size\i0  .  (Por defecto: $R9 MBytes)"

; HelpPage_Help_Option_logger_Paragraph_1
LangString HelpPage_Help_Option_logger_Paragraph_1 ${LANG_ENGLISH} "Sets the logger backends. (By default: $R9)"
LangString HelpPage_Help_Option_logger_Paragraph_1 ${LANG_FRENCH} "Définit le type de sortie pour logger. (Par défaut: $R9)"
LangString HelpPage_Help_Option_logger_Paragraph_1 ${LANG_SPANISH} "Establece los almacenes de los registros. (Por defecto: $R9)"

; HelpPage_Help_Option_logger_Paragraph_2
LangString HelpPage_Help_Option_logger_Paragraph_2 ${LANG_ENGLISH} \
"\i backend\i0  can be any of the following values:\par\
\par\
\tab\b File\b0 : Sends the log messages to a file (see \b /logfile\b0 )\par\
\tab\b Stderr\b0 : Sends the log messages to the console"
LangString HelpPage_Help_Option_logger_Paragraph_2 ${LANG_FRENCH} \
"\i backend\i0  peut avoir une des valeurs suivantes:\par\
\par\
\tab\b File\b0 : Envoie les messages de log vers un fichier (voir \b /logfile\b0 )\par\
\tab\b Stderr\b0 : Envoie les messages de log vers la console"
LangString HelpPage_Help_Option_logger_Paragraph_2 ${LANG_SPANISH} \
"\i backend\i0  puede ser cualquiera de los siguientes valores:\par\
\par\
\tab\b File\b0 : Envía los mensajes de registro a un fichero (ver \b /logfile\b0 )\par\
\tab\b Stderr\b0 : Envía los mensajes de registro a la consola"

; HelpPage_Help_Option_no-category_Paragraph_1
LangString HelpPage_Help_Option_no-category_Paragraph_1 ${LANG_ENGLISH} "Do not inventory the indicated categories of elements. (By default: $R9)"
LangString HelpPage_Help_Option_no-category_Paragraph_1 ${LANG_FRENCH} "Ne pas inventorier les éléments des catégories indiquées. (Par défaut: $R9)"
LangString HelpPage_Help_Option_no-category_Paragraph_1 ${LANG_SPANISH} "No realizar inventario de las categorías de elementos indicadas. (Por defecto: $R9)"

; HelpPage_Help_Option_no-category_Paragraph_2
LangString HelpPage_Help_Option_no-category_Paragraph_2 ${LANG_ENGLISH} \
"\i category\i0  can be any of the following values:\par\
\par\
\tab\b Environment\b0 : Environment variables\par\
\tab\b Printer\b0 : Printers\par\
\tab\b Process\b0 : System's processes (has no effect on Microsoft Windows systems)\par\
\tab\b Software\b0 : Software\par\
\tab\b User\b0 : Users\par\
\par If you indicate an empty string ($\"$\"), all categories of elements will be inventoried."
LangString HelpPage_Help_Option_no-category_Paragraph_2 ${LANG_FRENCH} \
"\i category\i0  peut avoir une des valeurs suivantes:\par\
\par\
\tab\b Environment\b0 : variables d'Environnement\par\
\tab\b Printer\b0 : Imprimante\par\
\tab\b Process\b0 : Processus système (n'a aucun effet sur les systèmes Microsoft Windows)\par\
\tab\b Software\b0 : Logiciel\par\
\tab\b User\b0 : Utilisateurs\par\
\par Si vous indiquez une chaîne vide ($\"$\"), toutes les éléments des catégories seront inventoriés."
LangString HelpPage_Help_Option_no-category_Paragraph_2 ${LANG_SPANISH} \
"\i category\i0  puede ser cualquiera de los siguientes valores:\par\
\par\
\tab\b Environment\b0 : Variables de entorno\par\
\tab\b Printer\b0 : Impresoras\par\
\tab\b Process\b0 : Procesos del sistema (no tiene efecto en sistemas Microsoft Windows)\par\
\tab\b Software\b0 : \i Software\i0\par\
\tab\b User\b0 : Usuarios\par\
\par Si indica una cadena vacía ($\"$\"), todas las categorías de elementos serán inventariadas."

; HelpPage_Help_Option_no-httpd_Paragraph_1
LangString HelpPage_Help_Option_no-httpd_Paragraph_1 ${LANG_ENGLISH} "Disables the embedded web server. (By default: $R9)"
LangString HelpPage_Help_Option_no-httpd_Paragraph_1 ${LANG_FRENCH} "Désactive le serveur web intégré . (Par défaut: $R9)"
LangString HelpPage_Help_Option_no-httpd_Paragraph_1 ${LANG_SPANISH} "Desactiva el servidor web integrado. (Por defecto: $R9)"

; HelpPage_Help_Option_no-p2p_Paragraph_1
LangString HelpPage_Help_Option_no-p2p_Paragraph_1 ${LANG_ENGLISH} "Do not use peer to peer to download files. (By default: $R9)"
LangString HelpPage_Help_Option_no-p2p_Paragraph_1 ${LANG_FRENCH} "Ne pas utiliser le P2P pour télécharger les fichiers. (Par défaut: $R9)"
LangString HelpPage_Help_Option_no-p2p_Paragraph_1 ${LANG_SPANISH} "No emplear \i peer to peer\i0  para descargar archivos. (Por defecto: $R9)"

; HelpPage_Help_Option_no-scan-homedirs_Paragraph_1
LangString HelpPage_Help_Option_no-scan-homedirs_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \b /scan-homedirs\b0 . See \b /scan-homedirs\b0  for more information."
LangString HelpPage_Help_Option_no-scan-homedirs_Paragraph_1 ${LANG_FRENCH} "Cette option est l'opposée de \b /scan-homedirs\b0 . Voir \b /scan-homedirs\b0  pour plus d'information."
LangString HelpPage_Help_Option_no-scan-homedirs_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \b /scan-homedirs\b0 . Ver \b /scan-homedirs\b0  para más información."

; HelpPage_Help_Option_no-ssl-check_Paragraph_1
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_1 ${LANG_ENGLISH} "Do not check server certificate. (By default: $R9)"
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_1 ${LANG_FRENCH} "Ne pas vérifier le certificat du serveur. (Par défaut: $R9)"
LangString HelpPage_Help_Option_no-ssl-check_Paragraph_1 ${LANG_SPANISH} "No comprobar el certificado del servidor. (Por defecto: $R9)"

; HelpPage_Help_Option_no-start-menu_Paragraph_1
LangString HelpPage_Help_Option_no-start-menu_Paragraph_1 ${LANG_ENGLISH} "Do not create the \i ${PRODUCT_NAME}\i0  folder on the Start Menu. (By default: $R9)"
LangString HelpPage_Help_Option_no-start-menu_Paragraph_1 ${LANG_FRENCH} "Ne pas créer le dossier \i ${PRODUCT_NAME}\i0  dans le Menu Démarrer. (Par défaut: $R9)"
LangString HelpPage_Help_Option_no-start-menu_Paragraph_1 ${LANG_SPANISH} "No crear la carpeta \i ${PRODUCT_NAME}\i0  en el Menú de Inicio. (Por defecto: $R9)"

; HelpPage_Help_Option_no-start-menu_Paragraph_2
LangString HelpPage_Help_Option_no-start-menu_Paragraph_2 ${LANG_ENGLISH} "The \i ${PRODUCT_NAME}\i0  folder, whether it is created, it is for all users."
LangString HelpPage_Help_Option_no-start-menu_Paragraph_2 ${LANG_FRENCH} "Le dossier \i ${PRODUCT_NAME}\i0  , s'il est créé, est pour tous les utilisateurs."
LangString HelpPage_Help_Option_no-start-menu_Paragraph_2 ${LANG_SPANISH} "La carpeta \i ${PRODUCT_NAME}\i0 , si es creada, lo es para todos los usuarios."

; HelpPage_Help_Option_no-task_Paragraph_1
LangString HelpPage_Help_Option_no-task_Paragraph_1 ${LANG_ENGLISH} "Disables the given tasks. (By default: $R9)"
LangString HelpPage_Help_Option_no-task_Paragraph_1 ${LANG_FRENCH} "Désactive les tâches indiquées. (Par défaut: $R9)"
LangString HelpPage_Help_Option_no-task_Paragraph_1 ${LANG_SPANISH} "Desactiva las tareas indicadas. (Por defecto: $R9)"

; HelpPage_Help_Option_no-task_Paragraph_2
LangString HelpPage_Help_Option_no-task_Paragraph_2 ${LANG_ENGLISH} \
"\i task\i0  can be any of the following values:\par\
\par\
\tab\b Deploy\b0 : Task Deploy\par\
\tab\b ESX\b0 : Task ESX\par\
\tab\b Inventory\b0 : Task Inventory\par\
\tab\b NetDiscovery\b0 : Task NetDiscovery\par\
\tab\b NetInventory\b0 : Task NetInventory\par\
\tab\b WakeOnLan\b0 : Task WakeOnLan\par\
\par If you indicate an empty string ($\"$\"), all tasks will be executed."
LangString HelpPage_Help_Option_no-task_Paragraph_2 ${LANG_FRENCH} \
"\i task\i0  peut avoir une des valeurs suivantes:\par\
\par\
\tab\b Deploy\b0 : Tâche de Déploiement\par\
\tab\b ESX\b0 : Tâche ESX\par\
\tab\b Inventory\b0 : Tâche d'Inventaire\par\
\tab\b NetDiscovery\b0 : Tâche NetDiscovery\par\
\tab\b NetInventory\b0 : Tâche NetInventory\par\
\tab\b WakeOnLan\b0 : Tâche WakeOnLan\par\
\par Si vous indiquez une chaîne vide ($\"$\"), toutes les tâches seront exécutées."
LangString HelpPage_Help_Option_no-task_Paragraph_2 ${LANG_SPANISH} \
"\i task\i0  puede ser cualquiera de los siguientes valores:\par\
\par\
\tab\b Deploy\b0 : Tarea Deploy\par\
\tab\b ESX\b0 : Tarea ESX\par\
\tab\b Inventory\b0 : Tarea Inventory\par\
\tab\b NetDiscovery\b0 : Tarea NetDiscovery\par\
\tab\b NetInventory\b0 : Tarea NetInventory\par\
\tab\b WakeOnLan\b0 : Tarea WakeOnLan\par\
\par Si indica una cadena vacía ($\"$\"), todas las tareas serán ejecutadas."

; HelpPage_Help_Option_p2p_Paragraph_1
LangString HelpPage_Help_Option_p2p_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \b /no-p2p\b0 . See \b /no-p2p\b0  for more information."
LangString HelpPage_Help_Option_p2p_Paragraph_1 ${LANG_FRENCH} "Cette option est l'opposée de \b /no-p2p\b0 . Voir \b /no-p2p\b0  pour plus d'information."
LangString HelpPage_Help_Option_p2p_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \b /no-p2p\b0 . Ver \b /no-p2p\b0  para más información."

; HelpPage_Help_Option_password_Paragraph_1
LangString HelpPage_Help_Option_password_Paragraph_1 ${LANG_ENGLISH} "Uses \i password\i0  as password for server authentication. (By default: $R9)"
LangString HelpPage_Help_Option_password_Paragraph_1 ${LANG_FRENCH} "Utilise \i password\i0  comme mot de passe pour l'authentification serveur. (Par défaut: $R9)"
LangString HelpPage_Help_Option_password_Paragraph_1 ${LANG_SPANISH} "Emplea \i password\i0  como palabra de paso en la autenticación con el servidor. (Por defecto: $R9)"

; HelpPage_Help_Option_password_Paragraph_2
LangString HelpPage_Help_Option_password_Paragraph_2 ${LANG_ENGLISH} "The \b /password\b0  comes into play only if you have also indicated a value for the \b /server\b0  option."
LangString HelpPage_Help_Option_password_Paragraph_2 ${LANG_FRENCH} "L'option \b /password\b0  est utilisée seulement si vous avez aussi donné une valeur à l'option \b /server\b0  ."
LangString HelpPage_Help_Option_password_Paragraph_2 ${LANG_SPANISH} "La opción \b /password\b0  entra en juego únicamente si se ha indicado también un valor para la opción \b /server\b0 ."

; HelpPage_Help_Option_proxy_Paragraph_1
LangString HelpPage_Help_Option_proxy_Paragraph_1 ${LANG_ENGLISH} "Uses \i URI\i0  as HTTP/S proxy server. (By default: $R9)"
LangString HelpPage_Help_Option_proxy_Paragraph_1 ${LANG_FRENCH} "Utilise \i URI\i0  comme serveur proxy HTTP/S. (Par défaut: $R9)"
LangString HelpPage_Help_Option_proxy_Paragraph_1 ${LANG_SPANISH} "Emplea \i URI\i0  como servidor \i proxy\i0  HTTP/S. (Por defecto: $R9)"

; HelpPage_Help_Option_runnow_Paragraph_1
LangString HelpPage_Help_Option_runnow_Paragraph_1 ${LANG_ENGLISH} "Launches the agent immediately after its installation. (By default: $R9)"
LangString HelpPage_Help_Option_runnow_Paragraph_1 ${LANG_FRENCH} "Lance l'agent immédiatement après l'installation. (Par défaut: $R9)"
LangString HelpPage_Help_Option_runnow_Paragraph_1 ${LANG_SPANISH} "Lanza el agente inmediatamente después de su instalación. (Por defecto: $R9)"

; HelpPage_Help_Option_S_Paragraph_1
LangString HelpPage_Help_Option_S_Paragraph_1 ${LANG_ENGLISH} "Silent installation. (By default: $R9)"
LangString HelpPage_Help_Option_S_Paragraph_1 ${LANG_FRENCH} "Installation silencieuse. (Par défaut: $R9)"
LangString HelpPage_Help_Option_S_Paragraph_1 ${LANG_SPANISH} "Instalación silenciosa. (Por defecto: $R9)"

; HelpPage_Help_Option_S_Paragraph_2
LangString HelpPage_Help_Option_S_Paragraph_2 ${LANG_ENGLISH} "You must accept the license in a explicit way (see \b /acceptlicense\b0 ) if you perform the installation in silent mode."
LangString HelpPage_Help_Option_S_Paragraph_2 ${LANG_FRENCH} "Vous devez accepter clairement la licence (voir \b /acceptlicense\b0 )  si vous désirez installer en mode silencieux."
LangString HelpPage_Help_Option_S_Paragraph_2 ${LANG_SPANISH} "Debe aceptar la licencia de modo explícito (ver \b /acceptlicense\b0 ) si realiza la instalación en modo silencioso."

; HelpPage_Help_Option_scan-homedirs_Paragraph_1
LangString HelpPage_Help_Option_scan-homedirs_Paragraph_1 ${LANG_ENGLISH} "Allows the agent to scan home directories for virtual machines. (By default: $R9)"
LangString HelpPage_Help_Option_scan-homedirs_Paragraph_1 ${LANG_FRENCH} "Autorise l'agent à scanner les dossiers utilisateurs pour trouver les machines virtuelles. (Par défaut: $R9)"
LangString HelpPage_Help_Option_scan-homedirs_Paragraph_1 ${LANG_SPANISH} "Permite al agente buscar máquinas virtuales en los directorios \i home\i0 . (Por defecto: $R9)"

; HelpPage_Help_Option_server_Paragraph_1
LangString HelpPage_Help_Option_server_Paragraph_1 ${LANG_ENGLISH} "Sends results of tasks execution to given servers. (By default: $R9)"
LangString HelpPage_Help_Option_server_Paragraph_1 ${LANG_FRENCH} "Envoie les résultats de l'exécution des tâches aux serveurs donnés. (Par défaut: $R9)"
LangString HelpPage_Help_Option_server_Paragraph_1 ${LANG_SPANISH} "Envia los resultados de la ejecución de las tareas a los servidores indicados. (Por defecto: $R9)"

; HelpPage_Help_Option_server_Paragraph_2
LangString HelpPage_Help_Option_server_Paragraph_2 ${LANG_ENGLISH} "If you indicate an empty string ($\"$\"), the results of tasks execution will not be written remotely."
LangString HelpPage_Help_Option_server_Paragraph_2 ${LANG_FRENCH} "Si vous indiquez une chaîne vide ($\"$\"), le résultat de l'exécution des tâches ne pourra pas être envoyé."
LangString HelpPage_Help_Option_server_Paragraph_2 ${LANG_SPANISH} "Si indica una cadena vacía ($\"$\"), los resultados de la ejecución de las tareas no se escribirán remotamente."

; HelpPage_Help_Option_server_Paragraph_3
LangString HelpPage_Help_Option_server_Paragraph_3 ${LANG_ENGLISH} "You can use the \b /server\b0  and \b /local\b0  options simultaneously."
LangString HelpPage_Help_Option_server_Paragraph_3 ${LANG_FRENCH} "Vous pouvez utiliser les options \b /server\b0  et \b /local\b0  simultanément."
LangString HelpPage_Help_Option_server_Paragraph_3 ${LANG_SPANISH} "Puede emplear las opciones \b /server\b0  y \b /local\b0  simultáneamente."

; HelpPage_Help_Option_ssl-check_Paragraph_1
LangString HelpPage_Help_Option_ssl-check_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \b /no-ssl-check\b0 . See \b /no-ssl-check\b0  for more information."
LangString HelpPage_Help_Option_ssl-check_Paragraph_1 ${LANG_FRENCH} "Cette option est l'opposée de \b /no-ssl-check\b0 . Voir \b /no-ssl-check\b0  pour plus d'information."
LangString HelpPage_Help_Option_ssl-check_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \b /no-ssl-check\b0 . Ver \b /no-ssl-check\b0  para más información."

; HelpPage_Help_Option_start-menu_Paragraph_1
LangString HelpPage_Help_Option_start-menu_Paragraph_1 ${LANG_ENGLISH} "This option is the opposite of \b /no-start-menu\b0 . See \b /no-start-menu\b0  for more information."
LangString HelpPage_Help_Option_start-menu_Paragraph_1 ${LANG_FRENCH} "Cette option est l'opposée de \b /no-start-menu\b0 . Voir \b /no-start-menu\b0  pour plus d'information."
LangString HelpPage_Help_Option_start-menu_Paragraph_1 ${LANG_SPANISH} "Esta opción es la opuesta a \b /no-start-menu\b0 . Ver \b /no-start-menu\b0  para más información."

; HelpPage_Help_Option_tag_Paragraph_1
LangString HelpPage_Help_Option_tag_Paragraph_1 ${LANG_ENGLISH} "Marks the computer with the tag \i tag\i0  . (By default: $R9)"
LangString HelpPage_Help_Option_tag_Paragraph_1 ${LANG_FRENCH} "Marque l'ordinateur avec le tag \i tag\i0  . (Par défaut: $R9)"
LangString HelpPage_Help_Option_tag_Paragraph_1 ${LANG_SPANISH} "Marca el ordenador con la etiqueta \i tag\i0  . (Por defecto: $R9)"

; HelpPage_Help_Option_task-daily-modifier_Paragraph_1
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_1 ${LANG_ENGLISH} "Daily task schedule modifier. (By default: $R9 day)"
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_1 ${LANG_FRENCH} "Modification du cycle de tâche en jour. (Par défaut: $R9 jour)"
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_1 ${LANG_SPANISH} "Modificador de planificador de tareas diario. (Por defecto: $R9 día)"

; HelpPage_Help_Option_task-daily-modifier_Paragraph_2
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_2 ${LANG_ENGLISH} "\i modifier\i0  can take values between 1 and 30, both included."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_2 ${LANG_FRENCH} "\i modifier\i0  peut prendre une valeur entre 1 et 30, elles-même incluses."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_2 ${LANG_SPANISH} "\i modifier\i0  puede tomar valores entre 1 y 30, ambos incluidos."

; HelpPage_Help_Option_task-daily-modifier_Paragraph_3
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_3 ${LANG_ENGLISH} "The \b /task-daily-modifier\b0  option comes into play only if you have also indicated \b Daily\b0  as value of the \b /task-frequency\b0  option."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_3 ${LANG_FRENCH} "L'option \b /task-daily-modifier\b0  est utilisée seulement si vous avez aussi donné  \b Daily\b0  comme valeur à l'option \b /task-frequency\b0 ."
LangString HelpPage_Help_Option_task-daily-modifier_Paragraph_3 ${LANG_SPANISH} "La opción \b /task-daily-modifier\b0  entra en juego únicamente si ha indicado también \b Daily\b0  como valor de la opción \b /task-frequency\b0 ."

; HelpPage_Help_Option_task-frequency_Paragraph_1
LangString HelpPage_Help_Option_task-frequency_Paragraph_1 ${LANG_ENGLISH} "Frequency for task schedule. (By default: \b $R9\b0 )"
LangString HelpPage_Help_Option_task-frequency_Paragraph_1 ${LANG_FRENCH} "Fréquence pour le gestionnaire de tâche. (Par défaut: \b $R9\b0 )"
LangString HelpPage_Help_Option_task-frequency_Paragraph_1 ${LANG_SPANISH} "Frecuencia para el planificador de tareas. (Por defecto: \b $R9\b0 )"

; HelpPage_Help_Option_task-frequency_Paragraph_2
LangString HelpPage_Help_Option_task-frequency_Paragraph_2 ${LANG_ENGLISH} \
"\i frequency\i0  can be any of the following values:\par\
\par\
\tab\b Minute\b0 : At minute intervals (see option \b /task-minute-modifier\b0 )\par\
\tab\b Hourly\b0 : At hour intervals (see option \b /task-hourly-modifier\b0 )\par\
\tab\b Daily\b0 : At day intervals (see option \b /task-daily-modifier\b0 )"
LangString HelpPage_Help_Option_task-frequency_Paragraph_2 ${LANG_FRENCH} \
"\i frequency\i0  peut avoir une des valeurs suivantes:\par\
\par\
\tab\b Minute\b0 : Intervalles en minute (Voir option \b /task-minute-modifier\b0 )\par\
\tab\b Hourly\b0 : Intervalles en heure (voir option \b /task-hourly-modifier\b0 )\par\
\tab\b Daily\b0 : Intervalles en jour (voir option \b /task-daily-modifier\b0 )"
LangString HelpPage_Help_Option_task-frequency_Paragraph_2 ${LANG_SPANISH} \
"\i frequency\i0  puede ser cualquiera de los siguientes valores:\par\
\par\
\tab\b Minute\b0 : En intervalos de minuto (ver opción \b /task-minute-modifier\b0 )\par\
\tab\b Hourly\b0 : En intervalos de hora (ver opción \b /task-hourly-modifier\b0 )\par\
\tab\b Daily\b0 : En intervalos de día (ver opción \b /task-daily-modifier\b0 )"

; HelpPage_Help_Option_task-hourly-modifier_Paragraph_1
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_1 ${LANG_ENGLISH} "Hourly task schedule modifier. (By default: $R9 hour)"
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_1 ${LANG_FRENCH} "Modification du cycle de tâche en heure. (Par défaut: $R9 heure)"
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_1 ${LANG_SPANISH} "Modificador de planificador de tareas horario. (Por defecto: $R9 hora)"

; HelpPage_Help_Option_task-hourly-modifier_Paragraph_2
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_2 ${LANG_ENGLISH} "\i modifier\i0  can take values between 1 and 23, both included."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_2 ${LANG_FRENCH} "\i modifier\i0  peut prendre une valeur entre 1 et 23, elles-mêmes incluses."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_2 ${LANG_SPANISH} "\i modifier\i0  puede tomar valores entre 1 y 23, ambos incluidos."

; HelpPage_Help_Option_task-hourly-modifier_Paragraph_3
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_3 ${LANG_ENGLISH} "The \b /task-hourly-modifier\b0  option comes into play only if you have also indicated \b Hourly\b0  as value of the \b /task-frequency\b0  option."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_3 ${LANG_FRENCH} "L'option \b /task-hourly-modifier\b0  est utilisée seulement si vous avez aussi donné \b Hourly\b0  comme valeur à l'option \b /task-frequency\b0 ."
LangString HelpPage_Help_Option_task-hourly-modifier_Paragraph_3 ${LANG_SPANISH} "La opción \b /task-hourly-modifier\b0  entra en juego únicamente si ha indicado también \b Hourly\b0  como valor de la opción \b /task-frequency\b0 ."

; HelpPage_Help_Option_task-minute-modifier_Paragraph_1
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_1 ${LANG_ENGLISH} "Minute task schedule modifier. (By default: $R9 minutes)"
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_1 ${LANG_FRENCH} "Modification du cycle de tâche en minute. (Par défaut: $R9 minutes)"
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_1 ${LANG_SPANISH} "Modificador de planificador de tareas por minutos. (Por defecto: $R9 minutos)"

; HelpPage_Help_Option_task-minute-modifier_Paragraph_2
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_2 ${LANG_ENGLISH} "\i modifier\i0  can take the following values: 15, 20 or 30."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_2 ${LANG_FRENCH} "\i modifier\i0  peut avoir comme valeur : 15, 20 ou 30."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_2 ${LANG_SPANISH} "\i modifier\i0  puede tomar los siguientes valores: 15, 20 ó 30."

; HelpPage_Help_Option_task-minute-modifier_Paragraph_3
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_3 ${LANG_ENGLISH} "The \b /task-minute-modifier\b0  option comes into play only if you have also indicated \b Minute\b0  as value of the \b /task-frequency\b0  option."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_3 ${LANG_FRENCH} "L'option \b /task-minute-modifier\b0  est utilisée seulement si vous avez aussi donné \b Minute\b0  comme valeur à l'option \b /task-frequency\b0  ."
LangString HelpPage_Help_Option_task-minute-modifier_Paragraph_3 ${LANG_SPANISH} "La opción \b /task-minute-modifier\b0  entra en juego únicamente si ha indicado también \b Minute\b0  como valor de la opción \b /task-frequency\b0 ."

; HelpPage_Help_Option_timeout_Paragraph_1
LangString HelpPage_Help_Option_timeout_Paragraph_1 ${LANG_ENGLISH} "Sets the limit time (in seconds) to connect with the server. (By default: $R9 seconds)"
LangString HelpPage_Help_Option_timeout_Paragraph_1 ${LANG_FRENCH} "Définit le temps limite (en seconde) de connexion avec le serveur. (Par défaut: $R9 secondes)"
LangString HelpPage_Help_Option_timeout_Paragraph_1 ${LANG_SPANISH} "Establece el tiempo límite (en segundos) para conectar con el servidor. (Por defecto: $R9 segundos)"

; HelpPage_Help_Option_timeout_Paragraph_2
LangString HelpPage_Help_Option_timeout_Paragraph_2 ${LANG_ENGLISH} "The \b /timeout\b0  option comes into play only if you have also indicated a value for the \b /server\b0  option."
LangString HelpPage_Help_Option_timeout_Paragraph_2 ${LANG_FRENCH} "L'option \b /timeout\b0  est utilisée seulement si vous avez indiqué une valeur à l'option \b /server\b0  ."
LangString HelpPage_Help_Option_timeout_Paragraph_2 ${LANG_SPANISH} "La opción \b /timeout\b0  entra en juego únicamente si se ha indicado también un valor para la opción \b /server\b0 ."

; HelpPage_Help_Option_user_Paragraph_1
LangString HelpPage_Help_Option_user_Paragraph_1 ${LANG_ENGLISH} "Uses \i user\i0  as user for server authentication. (By default: $R9)"
LangString HelpPage_Help_Option_user_Paragraph_1 ${LANG_FRENCH} "Utilise \i user\i0  comme utilisateur pour l'authentification avec le serveur. (Par défaut: $R9)"
LangString HelpPage_Help_Option_user_Paragraph_1 ${LANG_SPANISH} "Emplea \i user\i0  como usuario en la autenticación con el servidor. (Por defecto: $R9)"

; HelpPage_Help_Option_user_Paragraph_2
LangString HelpPage_Help_Option_user_Paragraph_2 ${LANG_ENGLISH} "The \b /user\b0  option comes into play only if you have also indicated a value for the \b /server\b0  option."
LangString HelpPage_Help_Option_user_Paragraph_2 ${LANG_FRENCH} "L'option \b /user\b0  est utilisée seulement si vous avez indiqué une valeur à l'option \b /server\b0  ."
LangString HelpPage_Help_Option_user_Paragraph_2 ${LANG_SPANISH} "La opción \b /user\b0  entra en juego únicamente si se ha indicado también un valor para la opción \b /server\b0 ."

; HelpPage_Help_Examples
LangString HelpPage_Help_Examples ${LANG_ENGLISH} "EXAMPLES"
LangString HelpPage_Help_Examples ${LANG_FRENCH} "EXEMPLES"
LangString HelpPage_Help_Examples ${LANG_SPANISH} "EJEMPLOS"

; HelpPage_Help_Examples_Paragraph_1
LangString HelpPage_Help_Examples_Paragraph_1 ${LANG_ENGLISH} "ToDo"
LangString HelpPage_Help_Examples_Paragraph_1 ${LANG_FRENCH} "À faire"
LangString HelpPage_Help_Examples_Paragraph_1 ${LANG_SPANISH} "Por hacer"

; HelpPage_Help_Version
LangString HelpPage_Help_Version ${LANG_ENGLISH} "VERSION"
LangString HelpPage_Help_Version ${LANG_FRENCH} "VERSION"
LangString HelpPage_Help_Version ${LANG_SPANISH} "VERSIÓN"

; HelpPage_Help_Version_Paragraph_1
LangString HelpPage_Help_Version_Paragraph_1 ${LANG_ENGLISH} "This help is current for version ${FIAI_RELEASE} of ${PRODUCT_NAME}'s installer for Microsoft Windows."
LangString HelpPage_Help_Version_Paragraph_1 ${LANG_FRENCH} "Cette aide est pour la version ${FIAI_RELEASE} de l'installeur  ${PRODUCT_NAME} pour Microsoft Windows."
LangString HelpPage_Help_Version_Paragraph_1 ${LANG_SPANISH} "Esta ayuda está actualizada para la versión ${FIAI_RELEASE} del instalador para Microsoft Windows de ${PRODUCT_NAME}"

; HelpPage_Help_Bugs
LangString HelpPage_Help_Bugs ${LANG_ENGLISH} "REPORTING BUGS"
LangString HelpPage_Help_Bugs ${LANG_FRENCH} "REPORT DE BUGS"
LangString HelpPage_Help_Bugs ${LANG_SPANISH} "INFORME DE ERRORES"

; HelpPage_Help_Bugs_Paragraph_1
LangString HelpPage_Help_Bugs_Paragraph_1 ${LANG_ENGLISH} \
"User Mailing List\par\
\tab http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user\par\
\par Devel Mailing List\par\
\tab http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel\par\
\par Project Manager\par\
\tab http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer"
LangString HelpPage_Help_Bugs_Paragraph_1 ${LANG_FRENCH} \
"Liste de diffusion des utilisateurs\par\
\tab http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user\par\
\par Liste de diffusion des développeurs\par\
\tab http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel\par\
\par Gestion du Projet\par\
\tab http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer"
LangString HelpPage_Help_Bugs_Paragraph_1 ${LANG_SPANISH} \
"Lista de Correo de Usuarios\par\
\tab http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user\par\
\par Lista de Correo de Desarrollo\par\
\tab http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel\par\
\par Gestor del Proyecto\par\
\tab http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer"

; HelpPage_Help_Copyright
LangString HelpPage_Help_Copyright ${LANG_ENGLISH} "COPYRIGHT"
LangString HelpPage_Help_Copyright ${LANG_FRENCH} "COPYRIGHT"
LangString HelpPage_Help_Copyright ${LANG_SPANISH} "COPYRIGHT"

; HelpPage_Help_Copyright_Paragraph_1
LangString HelpPage_Help_Copyright_Paragraph_1 ${LANG_ENGLISH} "Copyright 2012-2013 FusionInventory Team. GNU GPL version 2 or (at your option) any later version <http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html>. This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law."
LangString HelpPage_Help_Copyright_Paragraph_1 ${LANG_FRENCH} "Copyright 2012-2013 FusionInventory Team. GNU GPL version 2 ou (suivant votre option) toute version ultérieure <http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html>. Ceci est un logiciel libre: vous êtes libre de le modifier et le redistribuer. Il n'y a AUCUNE GARANTIE dans la limite autorisée par la loi."
LangString HelpPage_Help_Copyright_Paragraph_1 ${LANG_SPANISH} "Copyright 2012-2013 FusionInventory Team. GNU GPL versión 2 o (en su opinión) cualquier versión posterior <http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html>. Esto es \i software\i0  libre, es libre de cambiarlo y distribuirlo. Este programa se ofrece SIN GARANTÍA ALGUNA."

; HelpPage_Help_SeeAlso
LangString HelpPage_Help_SeeAlso ${LANG_ENGLISH} "SEE ALSO"
LangString HelpPage_Help_SeeAlso ${LANG_FRENCH} "VOIR AUSSI"
LangString HelpPage_Help_SeeAlso ${LANG_SPANISH} "VER ADEMÁS"

; HelpPage_Help_SeeAlso_Paragraph_1
LangString HelpPage_Help_SeeAlso_Paragraph_1 ${LANG_ENGLISH} \
"FusionInventory Web Site\par\
\tab http://www.fusioninventory.org/"
LangString HelpPage_Help_SeeAlso_Paragraph_1 ${LANG_FRENCH} \
"Site Web FusionInventory \par\
\tab http://www.fusioninventory.org/"
LangString HelpPage_Help_SeeAlso_Paragraph_1 ${LANG_SPANISH} \
"Sitio Web de FusionInventory\par\
\tab http://www.fusioninventory.org/"

; HelpPage_Help_Author
LangString HelpPage_Help_Author ${LANG_ENGLISH} "AUTHOR"
LangString HelpPage_Help_Author ${LANG_FRENCH} "AUTEUR"
LangString HelpPage_Help_Author ${LANG_SPANISH} "AUTOR"

; HelpPage_Help_Author_Paragraph_1
LangString HelpPage_Help_Author_Paragraph_1 ${LANG_ENGLISH} "Tomás Abad <tabadgp@gmail.com>"
LangString HelpPage_Help_Author_Paragraph_1 ${LANG_FRENCH} "Tomás Abad <tabadgp@gmail.com>"
LangString HelpPage_Help_Author_Paragraph_1 ${LANG_SPANISH} "Tomás Abad <tabadgp@gmail.com>"


!endif
