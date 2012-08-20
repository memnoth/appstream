/* application.vala
 *
 * Copyright (C) 2012 Matthias Klumpp
 *
 * Licensed under the GNU General Public License Version 3
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using Uai.Utils;

namespace Uai {

public class AppInfo : Object {
	public string pkgname { get; set; }
	private string _name;
	public string name {
			get {
				if (str_empty (_name))
					return name_original;
				else
					return _name;
			}
			set {
				_name = value;
			}
		}// Localized!
	public string name_original { get; set; } // Not localized!
	public string summary { get; set; } // Localized!
	public string description { get; set; } // Localized!
	public string[] keywords { get; set; } // Localized!
	public string url { get; set; }
	public string desktop_file { get; set; }

	public string icon { get; set; }
	public string[] categories { get; set; }

	public string[] mimetypes { get; set; }


	public AppInfo () {
		pkgname = "";
		_name = "";
		name_original = "";
		summary = "";
		description = "";
		url = "";
		desktop_file = "";
		icon = "";
		//categories = "";
	}

	public bool is_valid () {
		if ((pkgname != "") && (desktop_file != "") && (name != "") && (name_original != ""))
			return true;
		return false;
	}

	public string to_string () {
		string res;
		res = "[AppInfo::%s]> name: %s | desktop: %s | summary: %s".printf (pkgname, name, desktop_file, summary);
		return res;
	}

}

} // End of namespace: Uai