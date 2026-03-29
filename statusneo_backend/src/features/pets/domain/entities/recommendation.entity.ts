import {type Product } from './product.entity';

export interface Recommendation {
  petId: string;
  planName: string;
  dailyKcal: number;
  dailyPortionGrams: number;
  recommendedProteins: string[];
  products: Product[];
}