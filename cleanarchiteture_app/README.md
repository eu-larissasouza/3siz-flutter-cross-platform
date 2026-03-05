# clean_architeture_app

Pasta destinada ao app para estudo da Clean Architeture

Aula 25/02/2026 = Entity, Models (DTO) and HTTP Client

Aula 04/03/2026 = Controller, Page

## Estrutura de pastas:

```
lib/
  ├── main.dart
  ├── core/
  │   └── http_client.dart
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

Observações:

http_client.dart = Flutter já possui esse arquivo na biblioteca, então teremos um custom

data/models/ = models/ - Representam os DTOs que fazem a comunicação entre a entidade e o retorno da API