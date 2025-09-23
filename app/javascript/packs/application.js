// app/javascript/packs/application.js

import "../stylesheets/application.scss"  // CSS -> SCSS に変更

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Bootstrap JS
import "bootstrap/dist/js/bootstrap"
import "@popperjs/core";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
