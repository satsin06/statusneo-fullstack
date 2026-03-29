import {type Product } from '../../domain/entities/product.entity';

export const productsFixture: Product[] = [
  {
    id: 'prod_1',
    name: 'Lamb & Rice Fresh Bowl',
    description: 'Freshly prepared lamb meal with brown rice and vegetables.',
    protein: 'lamb',
    priceAed: 149,
    imageUrl: 'https://placehold.co/400x400?text=Lamb+Meal',
  },
  {
    id: 'prod_2',
    name: 'Turkey & Sweet Potato Feast',
    description: 'Lean turkey meal with sweet potato and greens.',
    protein: 'turkey',
    priceAed: 139,
    imageUrl: 'https://placehold.co/400x400?text=Turkey+Meal',
  },
  {
    id: 'prod_3',
    name: 'Salmon Grain-Free Delight',
    description: 'Omega-rich salmon meal for healthy skin and coat.',
    protein: 'salmon',
    priceAed: 159,
    imageUrl: 'https://placehold.co/400x400?text=Salmon+Meal',
  },
  {
    id: 'prod_4',
    name: 'Chicken Power Bowl',
    description: 'High-protein chicken meal for active pets.',
    protein: 'chicken',
    priceAed: 129,
    imageUrl: 'https://placehold.co/400x400?text=Chicken+Meal',
  },
  {
    id: 'prod_5',
    name: 'Venison Premium Plate',
    description: 'Novel protein venison meal for sensitive pets.',
    protein: 'venison',
    priceAed: 169,
    imageUrl: 'https://placehold.co/400x400?text=Venison+Meal',
  },
];