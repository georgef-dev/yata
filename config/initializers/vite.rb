Rails.application.config.middleware.insert_before 0, Rack::Static, {
  urls: [ "/vite-dev" ],
  root: "public"
}
