import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'auth',
    loadChildren: () => import('./modules/auth/auth.module').then(m => m.AuthModule)
  },
  {
    path: 'admin',
    loadChildren: () => import('./modules/admin/admin.module').then(m => m.AdminModule)
  },
  {
    path: 'bodega',
    loadChildren: () => import('./modules/bodega/bodega.module').then(m => m.BodegaModule)
  },
  {
    path: 'cajero',
    loadChildren: () => import('./modules/cajero/cajero.module').then(m => m.CajeroModule)
  },
  {
    path: 'inventario',
    loadChildren: () => import('./modules/inventario/inventario.module').then(m => m.InventarioModule)
  },
  {
    path: '**',
    redirectTo: '/auth/login'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
