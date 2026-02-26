# clean_architeture_app

Pasta destinada ao app para estudo da Clean Architeture

## Estrutura de pastas:

```
lib/
  ├── main.dart
  ├── core/
  │   └── http_client.dart = Flutter já possui esse arquivo, então teremos um custom
  ├── presentation/
  │   ├── controllers/
  │   │   └── product_controller.dart
  │   └── pages/
  │       └── product_page.dart
  ├── domain/
  │   ├── entities/
  │   │   └── product_entity.dart
  │   ├── repositories/
  │   │   └── product_repository.dart
  │   └── usecases/
  │       └── get_products_usecase.dart
  └── data/
      ├── models/
      │   └── product_model.dart
      ├── datasources/
      │   └── product_remote_datasource.dart
      └── repositories/
          └── product_repository_impl.dart