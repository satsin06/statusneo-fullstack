import {type Product } from '../../domain/entities/product.entity';

export const productsFixture: Product[] = [
  {
    id: 'prod_1',
    name: 'Lamb & Rice Fresh Bowl',
    description: 'Freshly prepared lamb meal with brown rice and vegetables.',
    protein: 'lamb',
    priceAed: 149,
    imageUrl: 'https://img.freepik.com/free-photo/raw-lamb-meat-pork_1203-6758.jpg?semt=ais_incoming&w=740&q=80',
  },
  {
    id: 'prod_2',
    name: 'Turkey & Sweet Potato Feast',
    description: 'Lean turkey meal with sweet potato and greens.',
    protein: 'turkey',
    priceAed: 139,
    imageUrl: 'https://h2qshop.com/cdn/shop/articles/72-hour-smoked-turkey-959306.jpg?v=1731014385',
  },
  {
    id: 'prod_3',
    name: 'Salmon Grain-Free Delight',
    description: 'Omega-rich salmon meal for healthy skin and coat.',
    protein: 'salmon',
    priceAed: 159,
    imageUrl: 'https://t3.ftcdn.net/jpg/02/91/35/16/360_F_291351618_2ggRlHpK6pSwjUNtgMqhdaYliUYA5Jox.jpg',
  },
  {
    id: 'prod_4',
    name: 'Chicken Power Bowl',
    description: 'High-protein chicken meal for active pets.',
    protein: 'chicken',
    priceAed: 129,
    imageUrl: 'https://media.istockphoto.com/id/1282866808/photo/fresh-raw-chicken.jpg?s=612x612&w=0&k=20&c=QtfdAhdeIGpR3JUNDmYFo6cN0el8oYMcOXMQI7Qder4=',
  },
  {
    id: 'prod_5',
    name: 'Venison Premium Plate',
    description: 'Novel protein venison meal for sensitive pets.',
    protein: 'venison',
    priceAed: 169,
    imageUrl: 'https://media.istockphoto.com/id/104242074/photo/roe-deer-stroganoff.jpg?s=612x612&w=0&k=20&c=ZNjVd3hPU_ZB7le2H48VnkDK_lNiCVghgZ_o2R8gsgE=',
  },
];